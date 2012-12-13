(defun double (x) (* x 2))
(double 1) ; 2
#'double ; #<Compiled-function DOUBLE #x302000B6164F>

(lambda (x) (* x 2)) ; #<Anonymous Function #x302000CFC29F>
((lambda (x) (* x 2)) 2) ; 4

(setq double 2) ; 2
(symbol-value 'double) ; 2
(symbol-function 'double) ; #<Compiled-function DOUBLE #x302000B6164F>

(+ 1 2)
(apply #'+ '(1 2)) ; 3
(apply #'(lambda (x y) (* x y)) '(2 3)) ; 6
;; 引数をリストとして渡すのが面倒ならば => funcall
(funcall #'(lambda (x y) (* x y)) 2 3) ; 6

;; clojureのmap
(mapcar #'(lambda (x) (+ x 10))
	'(1 2 3)) ; (11 12 13)
(mapcar #'(lambda (x y) (+ x y))
	'(1 2 3)
	'(4 5 6)) ; (5 7 9)

(sort '(1 3 1 5 6) #'<) ; (1 1 3 5 6)

(remove-if #'evenp '(1 2 3)) ; (1 3)

(defun my-remove-if (fn lst)
  (if (null lst)
      nil
      (if (funcall fn (car lst))
	  (my-remove-if fn (cdr lst))
	  (cons (car lst) (my-remove-if fn (cdr lst))))))

(my-remove-if #'evenp '(1 2 3)) ; (1 3)

;; scope

(let ((y 7))
  (defun scope-test (x)
    (list x y)))

(scope-test 3) ; (3 7)

(let ((y 100))
  (scope-test 3)) ; (3 7)
;; 100への束縛は影響を与えない => レキスカルスコープ

;; incfは破壊的
(setq i 0)
(incf i)
(incf i)
i ; 2

(let ((counter 0))
  (defun new-id () (incf counter))
  (defun reset-id () (setq counter 0)))

(new-id) ; 1
(new-id) ; 2
(reset-id) ; 0
(new-id) ; 1
(new-id) ; 2

;; 以下はclでは動かない...
;; (let ((x 2)
;;       (y x))
;;   (+ x y))

;; labelsは関数に対するlet
(labels ((inc (x) (+ 1 x)))
  (inc 3)) ; 4

;; これを使うと再帰関数ができる
(defun count-instances (obj lsts)
  (labels ((instances-in (lst)
	     (if (null lst)
		 0
		 (+ (if (eq (car lst) obj) 1 0)
		    (instances-in (cdr lst))))))
    (mapcar #'instances-in lsts)))

(count-instances 'a '((a b c) (a d a) (a c c a))) ; (1 2 2)

