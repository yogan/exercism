#include "all_your_base.h"
#include <stdexcept>

namespace all_your_base {

    std::vector<unsigned int> convert(
            unsigned int input_base,
            const std::vector<unsigned int> &input_digits,
            unsigned int output_base)
    {
        if (input_base < 2 || output_base < 2)
        {
            throw std::invalid_argument("invalid base");
        }

        auto number = 0;

        for (auto digit : input_digits)
        {
            if (digit >= input_base)
            {
                throw std::invalid_argument("invalid digit");
            }
            number = number * input_base + digit;
        }

        std::vector<unsigned int> output_digits;

        while (number > 0)
        {
            output_digits.insert(output_digits.begin(), number % output_base);
            number /= output_base;
        }

        return output_digits;
    }

}  // namespace all_your_base
