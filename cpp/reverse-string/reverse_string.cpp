#include "reverse_string.h"

namespace reverse_string {
    std::string reverse_string(std::string str) {
        std::string reversed_str = "";
        for (long i = str.length() - 1; i >= 0; i--) {
            reversed_str += str.at(i);
        }
        return reversed_str;
    }
}
