(define x (+ 0 10000))

(define num-half (range 2 (+ 1(* x 2)) 2))

(define (mysqr n) (sqr (* (add1 n) 2)))

(define num-almost (build-list x mysqr))

(define pi-numerator (foldl * 1 num-almost))

(define den-half (range 1 (+ 2(* x 2)) 2))

(define (mysqr2 n) (sqr (+ (* 2 n) 3)))

(define den-almost (build-list x mysqr2))

(define almost-pi-denominator (foldl * 1 den-almost))

(define pi-denominator (/ almost-pi-denominator (+ 1(* x 2))))

(define my-pi (* 2 (/ pi-numerator pi-denominator)))

my-pi