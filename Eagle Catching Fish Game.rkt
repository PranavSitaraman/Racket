(define fish-LEFT (scale 0.4 (bitmap/url "https://www.takemefishing.org/tmf/assets/images/fish/american-shad-464x170.png")))
(define fish-RIGHT (scale 0.4 (bitmap/url "https://www.takemefishing.org/tmf/assets/images/fish/american-shad-464x170.png")))
(define eagle (scale 0.6 (bitmap/url "http://www.clipartkid.com/images/673/soaring-eagle-large-clip-art-at-clker-com-vector-clip-art-online-bsCscl-clipart.png")))
(define eagle-CAPTURE (scale 0.6 (bitmap/url "http://www.clipartkid.com/images/673/soaring-eagle-large-clip-art-at-clker-com-vector-clip-art-online-bsCscl-clipart.png")))

(define SCREEN-WIDTH 800)
(define SCREEN-HEIGHT 550)
(define BACKGROUND (empty-scene SCREEN-WIDTH SCREEN-HEIGHT))
(define eagle-HEIGHT (image-height eagle))
(define eagle-WIDTH (image-width eagle))
(define HALF-eagle-WIDTH (/ eagle-WIDTH 2))
(define HALF-eagle-HEIGHT (/ eagle-HEIGHT 2))
(define fish-HEIGHT (image-height fish-RIGHT))
(define fish-WIDTH (image-width fish-RIGHT))
(define HALF-fish-HEIGHT (/ fish-HEIGHT 2))
(define HALF-fish-WIDTH (/ fish-WIDTH 2))
(define fish-SPEED 8)
(define eagle-SPEED 3)

(define-struct fish (p dir))

(define fish0 (make-fish (make-posn (/ SCREEN-WIDTH 2) (- SCREEN-HEIGHT HALF-fish-HEIGHT)) "right"))
(define fish1 (make-fish (make-posn (/ SCREEN-WIDTH 4) (- SCREEN-HEIGHT HALF-fish-HEIGHT)) "right"))
(define fish2 (make-fish (make-posn (* SCREEN-WIDTH 3/4) (- SCREEN-HEIGHT HALF-fish-HEIGHT)) "left"))

(define-struct world (eagle fishs))

(define world0 (make-world (make-posn (/ SCREEN-WIDTH 2) HALF-eagle-HEIGHT)
                           (list fish0 fish1 fish2)))

(define (draw-fishs aloc scene)
  (cond
    [(empty? aloc) scene]
    [(cons? aloc) (place-image (cond
                                 [(string=? (fish-dir (first aloc)) "right")
                                  fish-RIGHT]
                                 [(string=? (fish-dir (first aloc)) "left")
                                  fish-LEFT])
                               (posn-x (fish-p (first aloc)))
                               (posn-y (fish-p (first aloc)))
                               (draw-fishs (rest aloc) scene))]))

(define (draw-eagle p scene eagle-img)
  (place-image eagle-img (posn-x p) (posn-y p) scene))

(define (draw w)
  (draw-fishs (world-fishs w)
             (draw-eagle (world-eagle w)
                       BACKGROUND (if (anything-touching-fish? (world-eagle w)
                                                              HALF-eagle-WIDTH
                                                              HALF-eagle-HEIGHT
                                                              (world-fishs w)) eagle-CAPTURE eagle))))

(define (move-eagle-y w)
  (make-world (make-posn (posn-x (world-eagle w))
                         (+ eagle-SPEED (posn-y (world-eagle w))))
              (world-fishs w)))

(define (move-eagle-x w key)
  (make-world 
   (make-posn  
    (cond
      [(and (key=? key "left") (not (hitting-wall? (world-eagle w) "left")))
       (- (posn-x (world-eagle w)) eagle-SPEED)]
      [(and (key=? key "right") (not (hitting-wall? (world-eagle w) "right")))
       (+ (posn-x (world-eagle w)) eagle-SPEED)]
      [else (posn-x (world-eagle w))])
    (posn-y (world-eagle w)))
   (world-fishs w)))

(define (eagle-done? w)
  (or
   (anything-touching-fish? (world-eagle w)
                           HALF-eagle-WIDTH
                           HALF-eagle-HEIGHT
                           (world-fishs w))
   (hitting-wall? (world-eagle w) "down")))

(define (anything-touching-fish? img-p img-w img-h aloc)
  (cond
    [(empty? aloc) false]
    [(cons? aloc)
     (or 
      (and
       (or
        (and (>= (- (posn-x img-p) img-w) (- (posn-x (fish-p (first aloc))) HALF-fish-WIDTH))
             (<= (- (posn-x img-p) img-w) (+ (posn-x (fish-p (first aloc))) HALF-fish-WIDTH)))
        (and (>= (+ (posn-x img-p) img-w) (- (posn-x (fish-p (first aloc))) HALF-fish-WIDTH))
             (<= (+ (posn-x img-p) img-w) (+ (posn-x (fish-p (first aloc))) HALF-fish-WIDTH))))
       (>= (+ (posn-y img-p) img-h) (- (posn-y (fish-p (first aloc))) HALF-fish-HEIGHT)))
      (anything-touching-fish? img-p img-w img-h (rest aloc)))]))

(define (remove-fish-from-list c aloc)
  (cond
    [(empty? aloc) empty]
    [(cons? aloc) (cond
                    [(posn=? (fish-p c) (fish-p (first aloc))) (rest aloc)]
                    [else (cons (first aloc) (remove-fish-from-list c (rest aloc)))])]))

(define (process-fish w)
  (make-world (world-eagle w) (move-fish (new-dirs (world-fishs w) (world-fishs w)))))

(define (move-all-on-tick w)
  (process-fish (move-eagle-y w)))

(define (move-fish aloc)
  (cond
    [(empty? aloc) empty]
    [(cons? aloc) (cons
                   (make-fish
                    (make-posn
                     (
                      (cond
                        [(string=? (fish-dir (first aloc)) "right") +]
                        [(string=? (fish-dir (first aloc)) "left") -])
                      (posn-x (fish-p (first aloc))) fish-SPEED)
                     (posn-y (fish-p (first aloc))))
                    (fish-dir (first aloc))) 
                   (move-fish (rest aloc)))]))

(define (new-dirs aloc1 aloc2)
  (cond
    [(empty? aloc1) empty]
    [(cons? aloc1) (cons (make-fish (fish-p (first aloc1))
                                   (update-dir (first aloc1) aloc2))
                         (new-dirs (rest aloc1) aloc2))]))

(define (update-dir c aloc)
  (cond
    [(hitting-wall? (fish-p c) "right") "left"]
    [(hitting-wall? (fish-p c) "left") "right"]
    [(anything-touching-fish? (fish-p c) HALF-fish-WIDTH HALF-fish-HEIGHT (remove-fish-from-list c aloc))
     (cond
       [(string=? (fish-dir c) "left") "right"]
       [(string=? (fish-dir c) "right") "left"])]
    [else (fish-dir c)]))

(define (hitting-wall? p dir)
  (cond
    [(string=? dir "right") (> (posn-x p) SCREEN-WIDTH)]
    [(string=? dir "left") (< (posn-x p) 0)]
    [(string=? dir "down") (> (posn-y p) SCREEN-HEIGHT)]))




(define (posn=? p1 p2)
  (and
   (= (posn-x p1) (posn-x p2))
   (= (posn-y p1) (posn-y p2))))

(js-big-bang world0
             (to-draw draw)
             (on-key move-eagle-x)
             (on-tick move-all-on-tick)
             (stop-when eagle-done?))