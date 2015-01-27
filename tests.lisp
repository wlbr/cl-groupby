;;; -*- Mode:LISP; Syntax: COMMON-LISP; Package: CL-USER; Base: 10; indent-tabs-mode: nil -*-

;; ***********************************************************
;;
;; Project: groupby
;; A higher order function named groupby as known from Scala.
;; 
;; File: tests.lisp
;;
;; Provides a simple test suite.
;; Not included in asdf system definition.
;; Requires unit test suite xlunit (available via quicklisp e.g.)
;; 
;; ***********************************************************


(in-package :cl-user)

(require :groupby)
(require :xlunit)

(use-package :xlunit)


(defclass groupbytest (test-case)
 ()
 )



(def-test-method test-uniqchar ((self groupbytest) :run nil)
  (let ((str "lisp rulez")
        (map  (gb:groupby #'(lambda (x) x) str :as-hashtable T)))
    (assert-eql #\i
                (find 1 str :test #'(lambda (i s) 
                         (= i (length (gethash s map))))))))

(def-test-method test-grouplists ((self groupbytest) :run nil)   
  (let ((group  (gb:groupby #'first '((a 1 2) (a 3 4) (b 5 6)))))
    (assert-equal '((B ((B 5 6))) (A ((A 1 2) (A 3 4))))
                  group)
    (assert-eql 2 (length (find 'a group :test #'(lambda (s l) 
                                                   (eq s (first l))))))))

(def-test-method test-grouplistusinghastable ((self groupbytest) :run nil)   
  (let ((group  (gb:groupby #'first '((a 1 2) (a 3 4) (b 5 6)) :as-hashtable t)))    
    (assert-eql 2 (length (gethash 'a group)))))


(progn
  (print "Testsuite Objecttest")
  (textui-test-run (get-suite groupbytest))
  )


