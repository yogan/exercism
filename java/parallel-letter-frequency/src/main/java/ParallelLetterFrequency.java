import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

class ParallelLetterFrequency {

    private String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        Map<Character, Integer> accFreq = new HashMap<>();

        Arrays.asList(this.texts)
                .parallelStream()
                .map(text -> this.countLetters(text))
                .forEach(freq -> {
                    freq.forEach((letter, count) -> accFreq.put(
                            letter,
                            accFreq.getOrDefault(letter, 0) + count));
                });

        return accFreq;
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
