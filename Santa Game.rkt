; a Player is a (make-player x y)
(define-struct player (x y))
; a Thing is a (make-thing x y speed)
(define-struct thing (x y speed))
; a World is a (make-world score timer player thing1 thing2 thing3)
(define-struct world (score timer player thing1 thing2 thing3))

; define initial world
(define PLAYER1 (make-player 320 380))
(define ENEMY   (make-thing 600 390 5))
(define RUBY    (make-thing 1500 250 10))
(define CLOUD   (make-thing 700 100 5))
(define player-image (scale 0.5 (bitmap/url "http://www.paradehohoho.com/themes/designed_by_tonik/images/header/santa-claus.png")))
(define cloud-image (scale 0.25 (bitmap/url "http://www.clker.com/cliparts/0/P/X/P/D/E/cloud-md.png")))
(define ruby-image (scale 0.25 (bitmap/url "http://weclipart.com/gimg/4B69D77980E5B22F/christmas-presents-clip-art-happy-holidays-830x889.png")))
(define dog-image (scale 0.5 (bitmap/url "https://rupensavoulian.files.wordpress.com/2016/12/the_grinch.png?w=240")))
(define bg-image (scale 2.4 (bitmap/url "http://weclipart.com/gimg/04ACBCB8BD946906/graphics-christmas-house-775688.gif")))
;; some sample worlds (at the start of the game, and at some random playing time)
(define START  (make-world 0 0 PLAYER1 ENEMY RUBY CLOUD))
(define PLAY   (make-world 0 0 PLAYER1 ENEMY (make-thing 300 250 20) (make-thing 100 100 20)))


; draw-world
(define (draw-world w)
  (overlay/align "middle" "top"
                 (text (string-append "The Adventures of Santa          Score:"
                                      (number->string (world-score w))) 20 "black")
                 (place-image (text "Use arrow keys to move. Jump on the grinch and catch the presents!" 11 "black")
                              360 35
                 (place-image player-image
                            (player-x (world-player w))
                            (player-y (world-player w))
                            (place-image cloud-image
                                         (thing-x (world-thing3 w))
                                         (thing-y (world-thing3 w))
                                         (place-image ruby-image
                                                      (thing-x (world-thing2 w))
                                                      (thing-y (world-thing2 w))
                                                      (place-image dog-image
                                                                   (thing-x (world-thing1 w))
                                                                   (thing-y (world-thing1 w))
                                                                   bg-image)))))))
; update a thing
(define (update-thing t)
  (make-thing (- (thing-x t) (thing-speed t)) (thing-y t) (thing-speed t)))

; update a player
(define (update-player p)
  (cond
    ((< (player-y p) 380) 
     (make-player (player-x p)(+ (player-y p) 14)))
    (else p)))

; player-distance
(define (player-distance p t)
  (sqrt (+ (expt (- (player-x p) (thing-x t)) 2)
           (expt (- (player-y p) (thing-y t)) 2))))

; collide? 
(define (collide? p t)
  (< (player-distance p t) 150))

; update the world
(define (update-world w)
  (cond
    ((and (collide? (world-player w) (world-thing1 w))
          (> (player-y (world-player w)) 200)
          (< (player-y (world-player w)) 300))
     (make-world (+ (world-score w) 10)
                 (world-timer w)  
                 (make-player (player-x (world-player w))
                              200)
                 (make-thing -1000 0 0)
                 (world-thing2 w)
                 (world-thing3 w)))
    ((collide? (world-player w) (world-thing2 w))
     (make-world (+ (world-score w) 1)
                 (world-timer w)
                 (update-player (world-player w))
                 (update-thing (world-thing1 w))
                 (make-thing -400 0 0)
                 (update-thing (world-thing3 w))))
    ((< (thing-x (world-thing1 w)) 0) 
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (update-player (world-player w))
                 (make-thing 700 390  5)
                 (update-thing (world-thing2 w))
                 (update-thing (world-thing3 w))))
    ((< (thing-x (world-thing2 w)) 0) 
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (update-player (world-player w))
                 (update-thing (world-thing1 w))
                 (make-thing 1500 200 5)
                 (update-thing (world-thing3 w))))
    ((< (thing-x (world-thing3 w)) 0)
     (make-world (world-score w)
                 (- (world-timer w) 1)
                 (update-player (world-player w))
                 (update-thing (world-thing1 w))
                 (update-thing (world-thing2 w))
                 (make-thing 700 (random 200) 5)))
    (else (make-world (world-score w)
                      (- (world-timer w) 1)
                      (update-player (world-player w))
                      (update-thing (world-thing1 w))
                      (update-thing (world-thing2 w))
                      (update-thing (world-thing3 w))))))

; keypress
(define (keypress w k)
  (cond
    ((and (string=? k "up") (>= (player-y (world-player w)) 320))
     (make-world (world-score w)
                 (world-timer w)
                 (make-player (player-x (world-player w))
                              100)
                 (world-thing1 w)
                 (world-thing2 w)
                 (world-thing3 w)))
    ((and (string=? k "right") (< (player-x (world-player w)) 600))
     (make-world (world-score w)
                 (world-timer w)
                 (make-player (+ (player-x (world-player w)) 20)
                              (player-y (world-player w)))
                 (world-thing1 w)
                 (world-thing2 w)
                 (world-thing3 w)))
    ((and (string=? k "left") (> (player-x (world-player w)) 50))
     (make-world (world-score w)
                 (world-timer w)
                 (make-player (- (player-x (world-player w)) 20)
                              (player-y (world-player w)))
                 (world-thing1 w)
                 (world-thing2 w)
                 (world-thing3 w)))
    (else (make-world (world-score w)
                      (world-timer w)
                      (world-player w)
                      (world-thing1 w)
                      (world-thing2 w)
                      (world-thing3 w)))))

; game over
(define (game-over w)
  (and (collide? (world-player w) (world-thing1 w))
       (> (player-y (world-player w)) 350))) 

(define (always-true w)
  true)

(big-bang START
          (on-tick update-world .05)
          (to-draw draw-world)
          (on-key keypress)
          #;(stop-when game-over)
	  (stop-when always-true))