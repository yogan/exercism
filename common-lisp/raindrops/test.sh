#!/bin/sh
ros run --load raindrops-test.lisp --eval '(uiop:quit (if (raindrops-test:run-tests) 0 1))'
