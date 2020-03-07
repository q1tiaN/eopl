; (define-syntax equal??
;     (syntax-rules ()
;         [
;             (_ test-exp correct-ans)
;                 (let ((observed-ans test-exp))
;                     (if(not(equal? observed-ans correct-ans))
;                         (
;                             (printf "~s returned ~s, should have returned ~s~%"
;                                 'test-exp
;                                 observed-ans
;                                 correct-ans
;                             )
;                         )
;                     )
;                 )
;         ]
;     )
; )

; (define nth-element
;     (lambda (lst n)
;       (if (null? lst)
;         (report-list-too-short n)
;         (if (zero? n)
;           (car lst)
;           (nth-element (cdr lst) (- n 1))))))

; (define report-list-too-short
;     (lambda (n)
;       (error 'nth-element 
;         "List too short by ~s elements.~%" (+ n 1))))

;  ;(equal?? (nth-element '(a b c d) 6) 'c)

;  ; p18 Exercise 1.9
;  (define remove
;     (lambda (s los)
;         (if(null? los)
;             '()
;             (if(eqv? s (car los))
;                 (remove s (cdr los))
;                 (cons (car los) (remove s (cdr los)))))))

; ;(equal?? (remove 'a '(a b c d ab a t 3 a f a)) '(b c d ab t 3 f))

; ; p22 Exercise 1.12
; (define subst
;     (lambda (new old slist)
;         (if (null? slist)
;             '()
;             (cons
;                 (if (symbol? (car slist))
;                     (if (eqv? (car slist) old) new (car slist))
;                     (subst new old (car slist)))
;                 (subst new old (cdr slist))))))

; ;(equal?? (remove 'a '(a b c d ab a t 3 a f a)) '(b c d ab t 3 f))


; ;p22 Exercise 1.13
; (define subst-map
;     (lambda (new old slist)
;         (if (null? slist)
;             '()
;             (map (lambda (sexp)
;                     (if (symbol? sexp)
;                     (if (eqv? sexp old) new sexp)
;                     (subst new old sexp)))
;                     slist
;                 ))))

; ;p26 

; ;Exercise 1.15
; (define duple
;     (lambda (n x)
;         (if(zero? n)
;             `()
;             (cons x 
;             (duple (- n 1) x)))))

; ;Exercise 1.16
; (define invert
;     (lambda (lst)
;         (if(null? lst)
;             '()
;             (cons
;             (cons (cadr (car lst)) (cons (car (car lst)) '()))
;             (invert (cdr lst))))))

; ;Exercise 1.17            
; (define down
;     (lambda (lst)
;         (if (null? lst)
;             '()
;             (cons 
;             (cons (car lst) '())
;             (down (cdr lst))))))

; ;Exercise 1.18
; (define swapper
;     (lambda (s1 s2 slist)
;         (if(null? slist)
;             '()
;             (cons
;                 (if(symbol? (car slist))
;                     (if (eqv? s1 (car slist))
;                         s2
;                         (if(eqv? s2 (car slist))
;                             s1
;                             (car slist)))
;                     (swapper s1 s2 (car slist)))
;                     (swapper s1 s2 (cdr slist))))))

; ;Exercise 1.19
; (define list-set
;     (lambda (lst n x)
;         (if (null? lst)
;          '()
;          (if (zero? n)
;             (cons x (cdr lst))
;             (cons (car lst) (list-set (cdr lst) (- n 1) x))))))

; ;Exercise 1.20
; (define count-occurrences
;     (lambda (s slist)
;         (if(null? slist)
;             0
;             (+
;                 (if(symbol? (car slist))
;                     (if (eqv? s (car slist)) 1 0)
;                     (count-occurrences s (car slist)))
;                 (count-occurrences s (cdr slist))))))

; ;Exercise 1.21
; (define product
;     (lambda (sos1 sos2)
;        (if (null? sos1)
;             '()
;             (if(null? sos2)
;                 '()
;                 (combin-el (car sos1) sos2 (product (cdr sos1) sos2))))))

; (define combin-el
;     (lambda (e sos lst)
;         (if (null? sos)
;             lst
;             (cons
;                 (cons e (cons (car sos) '()))
;                 (combin-el e (cdr sos) lst)))))

; ;Exercise 1.22

; (define filter-in
;     (lambda (pred lst)
;         (if (null? lst)
;             '()
;             (if(boolean=? (pred (car lst)) #t)
;                 (cons (car lst) (filter-in pred (cdr lst)))
;                 (filter-in pred (cdr lst))))))


; ;Exercise 1.23 

; ; (define list-index
; ;     (lambda (pred lst)
; ;         (if(null? lst)
; ;             #f
; ;             (if(boolean=? (pred (car lst)) #t)
; ;                 0
; ;                 (if (boolean=? (list-index pred (cdr lst)) #f)
; ;                     #f
; ;                     (+ (list-index pred (cdr lst)) 1))))))


; ;Exercise 1.24
; (define every?
;     (lambda (pred lst)
;         (if(null? lst)
;             #t
;             (if (boolean=? (pred (car lst)) #f)
;                 #f
;                 (every? pred (cdr lst))))))

; ;Exercise 1.25
; (define exists?
;     (lambda (pred lst)
;         (if(null? lst)
;             #f
;             (if (boolean=? (pred (car lst)) #t)
;                 #t
;                 (exists? pred (cdr lst))))))

; ;Exercise 1.26
; (define up 
;     (lambda (lst)
;         (if(null? lst)
;             '()
;             (if (list? (car lst))
;                 (if(null? (car lst))
;                     (up (cdr lst))
;                     (cons
;                         (car (car lst))
;                         (up (cons (cdr (car lst)) (cdr lst)))))
;                 (cons
;                     (car lst)
;                     (up (cdr lst)))))))

; ;Exercise 1.27
; (define flatten
;     (lambda (lst)
;         (if (null? lst)
;             '()
;             (if(list? (car lst))
;                 (if(null? (car lst))
;                     (flatten (cdr lst))
;                     (flatten (cons (car (car lst)) (cons (cdr (car lst)) (cdr lst)))))
;                 (cons 
;                     (car lst)
;                     (flatten (cdr lst)))))))

; ;Exercise 1.28
; (define merge
;     (lambda (loi1 loi2)
;         (if (null? loi1)
;             loi2
;             (if(null? loi2)
;             loi1
;             (if(< (car loi1) (car loi2))
;                 (cons 
;                     (car loi1)
;                     (merge (cdr loi1) loi2))
;                 (cons 
;                     (car loi2)
;                     (merge loi1 (cdr loi2))))))))

; ;Exercise 1.29
; (define sort
;     (lambda (loi)
;         (if (null? loi)
;             '()
;             (merge (cons (car loi) '()) (sort (cdr loi))))))


; ;Exercise 1.30
; (define merge/pred
;     (lambda (pred loi1 loi2)
;         (if (null? loi1)
;             loi2
;             (if(null? loi2)
;             loi1
;             (if(boolean=? (pred (car loi1) (car loi2)) #t)
;                 (cons 
;                     (car loi1)
;                     (merge/pred pred (cdr loi1) loi2))
;                 (cons 
;                     (car loi2)
;                     (merge/pred pred loi1 (cdr loi2))))))))

; (define sort/predicate
;     (lambda (pred loi)
;         (if (null? loi)
;             '()
;             (merge/pred pred (cons (car loi) '()) (sort/predicate pred (cdr loi))))))

;Exercise 1.31
(define leaf
    (lambda (i)
        i
    ))

(define interior-node
    (lambda (symb lson rson)
        (cons symb (cons lson (cons rson '())))))

(define leaf?
    (lambda (node)
        (if(symbol? node)
            #f
            (if (list? node)
                #f
                #t))))

        
;Exercise 1.32
; (define double-tree
;     (lambda (tree)
;         (if(null? tree)
;             '()
;             (if(leaf? (car tree))
;                (* (car tree) 2) '()
;                 (if symbol? (car tree)
;                     (cons (car tree) (cons (double-tree (car (cdr tree))) (cons (double-tree (car (cdr (cdr tree))) '())))))))))


;Exercise 1.33
(define mark-red-d
    (lambda (tree depth)
        (if (null? tree)
            '()
            (if(leaf? tree)
                depth
                (if(eqv? (car tree) 'red)
                    (cons (car tree) 
                        (cons (mark-red-d (car (cdr tree)) (+ depth 1))
                              (cons (mark-red-d (car (cdr (cdr tree))) (+ depth 1)) '())))
                    (cons (car tree) 
                        (cons (mark-red-d (car (cdr tree)) depth)
                              (cons (mark-red-d (car (cdr (cdr tree))) depth) '()))))))))

(define mark-red
    (lambda (tree)
        (mark-red-d tree 0)))


;Exercise 1.34
(define path
    (lambda (n bst)
        (if (= n (car bst))
            '()
            (if (< n (car bst))
                (cons 'left (path n (car (cdr bst))))
                (cons 'right (path n (car (cdr (cdr bst)))))))))

;Exercise 1.35
(define leaf-number
    (lambda (tree)
        (if(leaf? tree)
            1
            (if(null? tree)
                0
                (+ (leaf-number (car (cdr tree))) (leaf-number (car (cdr (cdr tree)))))))))

(define mark-number
    (lambda (tree num)
        (if (null? tree)
            '()
            (if(leaf? tree)
                num
                (cons (car tree) 
                    (cons (mark-number (car (cdr tree)) num) 
                        (cons (mark-number (car (cdr (cdr tree))) (+ num (leaf-number (car (cdr tree))))) '())
                        )))))
                        )

(define number-leaves
    (lambda (tree)
        (mark-number tree 0)))


;Exercise 1.36
(define number-elements
    (lambda (lst)
        (if (null? lst) '()
            (g (list 0 (car lst)) (number-elements (cdr lst))))))

(define g
    (lambda (lst plst)
        (if (null? plst)
            (cons lst '())
            (cons lst
                (g (list (+ (car (car plst)) 1) (car (cdr (car plst)))) (cdr plst))))))
                