(defpackage #:bob
  (:use #:common-lisp)
  (:export #:response-for))

(in-package #:bob)

(defun contains-alpha-chars-p (msg)
  (some #'(lambda (c) (char-not-greaterp #\a c #\z))
	(coerce msg 'list)))

(defun silence-p (msg) (equal "" (string-trim '(#\Space) msg)))
(defun shouting-p (msg) (and (contains-alpha-chars-p msg)
			     (equal msg (string-upcase msg))))
(defun questioning-p (msg) (equal #\? (char msg (1- (length msg)))))

(defun response-for (msg)
  (cond ((silence-p msg) "Fine. Be that way!")
	((shouting-p msg) "Whoa, chill out!")
	((questioning-p msg) "Sure.")
	(t "Whatever.")))
