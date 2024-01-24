TL;DR:

```bash
mkdir build
cd build
cmake -G "Unix Makefiles" ..
find .. -name '*.cpp' -or -name '*.h' | entr -cc make
```

More info at: https://exercism.org/docs/tracks/cpp/tests
