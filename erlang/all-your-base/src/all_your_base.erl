-module(all_your_base).

-export([rebase/3]).


rebase(_Digits, InputBase, _OutputBase) when InputBase < 2 ->
    {error, "input base must be >= 2"};

rebase(_Digits, _InputBase, OutputBase) when OutputBase < 2 ->
    {error, "output base must be >= 2"};

rebase(Digits, InputBase, OutputBase) ->
    case has_invalid_digit(Digits, InputBase) of
        true -> {error, "all digits must satisfy 0 <= d < input base"};
        false -> {ok, convert(Digits, InputBase, OutputBase)}
    end.

has_invalid_digit(Digits, Base) ->
    lists:any(fun(Digit) -> Digit >= Base orelse Digit < 0 end, Digits).

convert(Digits, InputBase, OutputBase) ->
    ConvertedDigits = to_digits(from_digits(Digits, InputBase), OutputBase),
    ReducedDigits = lists:dropwhile(fun(Digit) -> Digit == 0 end,
                                    lists:reverse(ConvertedDigits)),
    case ReducedDigits of
        [] -> [0];
        _ -> ReducedDigits
    end.

to_digits(0, _Base) -> [0];
to_digits(N, Base) -> [N rem Base | to_digits(N div Base, Base)].

from_digits(Digits, Base) ->
    lists:foldl(fun(Digit, Acc) -> Base * Acc + Digit end, 0, Digits).
