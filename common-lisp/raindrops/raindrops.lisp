(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun pling (n)
  (if (= (mod n 3) 0)
    "Pling"
    ""))

(defun plang (n)
  (if (= (mod n 5) 0)
    "Plang"
    ""))

(defun plong (n)
  (if (= (mod n 7) 0)
    "Plong"
    ""))

(defun convert (n)
  (let ((str (concatenate 'string (pling n) (plang n) (plong n))))
  (if (string= "" str)
    (write-to-string n)
    str)))
