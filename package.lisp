;;; -*- Mode:LISP; Syntax: COMMON-LISP; Package: CL-USER; Base: 10; indent-tabs-mode: nil -*-

;;; ***********************************************************
;;;
;;; Project: groubpy
;;; A higher order function named groupby as known from Scala.
;;;
;;; File: package.lisp
;;;
;;; ***********************************************************
(in-package :cl-user)

(require 'asdf)

(defpackage :groupby
  (:use :cl)
  (:nicknames :gb)
  (:export :groupby))
