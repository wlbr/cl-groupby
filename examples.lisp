;;; -*- Mode:LISP; Syntax: COMMON-LISP; Package: CL-USER; Base: 10; indent-tabs-mode: nil -*-

;; ***********************************************************
;;
;; Project: groupby
;; A higher order function named groupby as known from Scala.
;; 
;; File: examples.lisp
;;
;; Example code from the readme.
;; Not included in asdf system definition.
;;
;; ***********************************************************


(in-package :cl-user)

(require :groupby)




;----------------------------------
;---Examples
;----------------------------------

; find the first uniq char in string
(defparameter *str* "lisp rulez")

; nice Lisp solution
(defun first-uniq-char1 (str)
  (let ((res (remove-if #'(lambda (x) (> (count x str) 1)) str)))
    (if (string= "" res)
        nil
        (progn (print res)(elt res 0)))))

; a quick Lisp solution
(defun first-uniq-char2 (str)
  (let* ((size (length str))
         (cnt (make-hash-table :size size)))
    (do
        ((i 0 (incf i)) )
        ((<= size i))
      (incf (gethash (char str i) cnt 0)))
    (do 
        ((i 0 (incf i))
         (c nil))
        ((<= size i) 
         c)
      (setq c (char str i))
      (if (= 1 (gethash c cnt))
          (setq i size)
          (setq c NIL)))))


(first-uniq-char1 *str*)
(first-uniq-char2 *str*)

;a looong string
(defparameter *strlong* (coerce  (loop for i to 100000 collect (code-char (+ (char-code #\a) (random 25)))) 'string) )
(setf (elt *strlong* (truncate (length *strlong*) 2)) #\z)

(time (first-uniq-char1 *strlong*))   ; takes some minutes to run (2 on my laptop)
(time (first-uniq-char2 *strlong*))


; a groupby solution
(time (remove-if #'(lambda (x) (> (second x) 1)) 
                 (mapcar #'(lambda (x) (list (first x) (length (second x)))) 
                         (gb:groupby #'(lambda (x) x) *strlong*))))


;----------------------------------
;----------------------------------
;----------------------------------



