;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: CL-USER; Base: 10; indent-tabs-mode: nil -*-

;;; ***********************************************************
;;;
;;; Project: groupby
;;; A higher order function named groupby as known from Scala.
;;;
;;; File: package.lsp
;;;
;;; ***********************************************************

(asdf:defsystem :groupby
  :description "groupby: A higher order function named groupby as known from Scala."
  :author "Michael Wolber <mwolber@gmx.de>"
  :version "1.0.0"
  :serial t
  :components ((:file "package")
               (:file "groupby")))

