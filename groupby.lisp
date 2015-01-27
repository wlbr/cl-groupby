;;; -*- Mode:LISP; Syntax: COMMON-LISP; Package: GROUPBY; Base: 10; indent-tabs-mode: nil -*-

;; ***********************************************************
;;
;; Project: groupby
;; A higher order function named groupby as known from Scala.
;;
;; File: groupby.lisp
;;
;; ***********************************************************



(in-package :groupby)


;;  =============================================================


(defun groupby (function sequence &key (test #'eql) (as-hashtable nil))
  (let ((len (length sequence))
        (ht (make-hash-table :size 50 :test test)))
    (do ((i (1- len) (1- i))
         el fel)
        ((< i 0)
         ht)
      (setq el (elt sequence i))
      (setq fel (funcall function el))
      (setf (gethash fel ht) (cons el (gethash fel ht))))
    (if as-hashtable
        ht
         (loop for k being the hash-keys in ht
          using (hash-value v) collect (list k v)))
    ))
