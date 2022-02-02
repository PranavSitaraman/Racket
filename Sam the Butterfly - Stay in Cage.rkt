(require "bootstrap2012/cage-teachpack")

(define (safe-left? x) (> x 50))

(define (safe-right? x) (< x 590))

(define (safe-top? y) (< y 450))

(define (safe-bottom? y) (> y 30))

(define (onscreen? x y)
  (and (safe-left? x)
       (safe-right? x)
       (safe-top? y)
       (safe-bottom? y)))

(start onscreen?)