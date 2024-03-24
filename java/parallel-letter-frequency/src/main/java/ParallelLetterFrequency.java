import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

class ParallelLetterFrequency {

    private String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        return Arrays.stream(texts)
                .parallel()
                .map(this::letterFrequency)
                .flatMap(map -> map.entrySet().stream())
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        Integer::sum));
    }

    private Map<Character, Integer> letterFrequency(String text) {
        return text.chars()
                .filter(Character::isLetter)
                .map(Character::toLowerCase)
                .mapToObj(c -> (char) c)
                .collect(Collectors.toMap(
                        c -> c,
                        c -> 1,
                        Integer::sum));
    }
}
