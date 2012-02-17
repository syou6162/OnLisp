(ns OnLisp.chap2)

(defn double [x] (* x 2))
(double 1)

;; 違いは???
double
#'double

(fn [x] (* x 2))
((fn [x] (* x 2)) 2)

;; clojureではこれは動かない
;; (symbol-value double)

;; #'は実際の関数オブジェクトを対応させるもの
(symbol "foo") ; foo

;; http://clojure.org/reader

(var double) ; #'user/double
(def my-double (var double))
(my-double 2)

(apply + '(1 2 3))

(sort > '(1 2 3))

;; ダイナミックスコープ
;; 関数が定義された時点での変数の値には何の意味もない
;; 影響があるのは呼ばれたときの値

;; Clojureだとbindingだったかな
;; 以下の例、動かないのであとで調べる

(def my-var-for-binding 3)
(defn my-func-for-binding [x]
  (+ x my-var-for-binding))

(my-func-for-binding 3) ; 6

(binding [my-var-for-binding 10]
  (my-func-for-binding 3))

;; レキスカルスコープ
;; 関数が定義された時点での周りの環境を遡って調べる

;; p20
;; クロージャーは状態を持った関数と呼ばれている by SICP

