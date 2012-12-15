nil ; NIL
(null '()) ; T
'() ; NIL

;; 基本的な関数を抑える
(mapcar #'(lambda (x) (+ x 10))
	'(1 2 3)) ; (11 12 13)

(reduce #'(lambda (result i) (cons i result)) 
	'(1 2 3) 
	:initial-value nil) ; (3 2 1)

(defun sum (lst) 
  (reduce #'(lambda (result x)
	      (+ result x))
	  lst
	  :initial-value 0))
(sum '(1 2 3)) ; 6

;; consは要素、listの順番
(cons 0 '(1 2)) ; (0 1 2)
(length (cons 0 '(1 2))) ; 3

(car '(1 2 3)) ; 1
(cdr '(1 2 3)) ; (2 3)

(length "日本語") ; 3

;; なんだこの'stringってのは、面倒だな
(concatenate 'string "abc" "def") ; "abcdef"
(reverse "日本語") ; "語本日"

(setq japanese "日本語")
; nが付くと破壊的
(nreverse japanese) ; "語本日"
japanese ; "語本日"

(consp 1) ; NIL
(consp '(1 . 2)) ; T

(setq x '(1 2))
(cons 0 x) ; (0 1 2)
x ; (1 2)
(setq y '(3 4))
(nconc x y) ; (1 2 3 4)
x ; (1 2 3 4)
y ; (3 4)

(append '(1 2) '(3 4)) ; (1 2 3 4)

