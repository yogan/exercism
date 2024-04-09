(import (rnrs))

(define (score word)
  (define (letter-score letter)
    (cond
      ((member letter (string->list "AEIOULNRST")) 1)
      ((member letter (string->list "DG")) 2)
      ((member letter (string->list "BCMP")) 3)
      ((member letter (string->list "FHVWY")) 4)
      ((member letter (string->list "K")) 5)
      ((member letter (string->list "JX")) 8)
      ((member letter (string->list "QZ")) 10)
      (else 0)))
  (apply + (map letter-score (string->list (string-upcase word)))))
