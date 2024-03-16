import java.util.HashMap;
import java.util.Map;

class ParallelLetterFrequency {

    private String[] texts;

	ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        Map<Character, Integer> map = new HashMap<>();

        for (String text : this.texts) {
            this.countLetters(text, map);
        }

        return map;
    }


    private void countLetters(String text, Map<Character, Integer> map) {
        for (char c : text.toCharArray()) {
            if (Character.isLetter(c)) {
                char lowerC = Character.toLowerCase(c);
                map.put(lowerC, map.getOrDefault(lowerC, 0) + 1);
            }
        }
    }
}
