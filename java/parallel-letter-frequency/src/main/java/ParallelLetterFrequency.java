import java.util.Arrays;
import java.util.HashMap;
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
                .map(text -> this.countLetters(text))
                .flatMap(map -> map.entrySet().stream())
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        Integer::sum));
    }

    private Map<Character, Integer> countLetters(String text) {
        Map<Character, Integer> freqencies = new HashMap<>();

        for (char c : text.toCharArray()) {
            if (Character.isLetter(c)) {
                char lowerC = Character.toLowerCase(c);
                freqencies.put(lowerC, freqencies.getOrDefault(lowerC, 0) + 1);
            }
        }

        return freqencies;
    }
}
