(require bootstrap2012/function-teachpack)

(EXAMPLE (rocket-height 1) 
         (* 7 1))

(EXAMPLE (rocket-height 2) 
         (* 7 2))

(define (rocket-height seconds) 
  (* 7 seconds))

(EXAMPLE (rocket-speed 1)
  (* 1 1))

(EXAMPLE (rocket-speed 2)
  (* 2 2))

(define (rocket-speed seconds)
                      (* seconds seconds))

(EXAMPLE (rocket-down 1) 
         (* -7 1))

(EXAMPLE (rocket-down 2) 
         (* -7 2))

(define (rocket-down seconds) 
  (* -7 seconds))

(start rocket-height)