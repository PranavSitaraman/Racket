(define HEIGHT 300)
(define WIDTH (* HEIGHT 1.9))


(define line-of-stars (above (beside (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white"))
                             
                             (beside (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white")
                                     (star 10 "solid" "navy")
                                     (star 10 "solid" "white"))))


(define blue-and-star (overlay (above line-of-stars
                                      line-of-stars
                                      line-of-stars
                                      line-of-stars
                                      
                                      (beside (star 10 "solid" "white")
                                              (star 10 "solid" "navy")
                                              (star 10 "solid" "white")
                                              (star 10 "solid" "navy")
                                              (star 10 "solid" "white")
                                              (star 10 "solid" "navy")
                                              (star 10 "solid" "white")
                                              (star 10 "solid" "navy")
                                              (star 10 "solid" "white")
                                              (star 10 "solid" "navy")
                                              (star 10 "solid" "white"))
                                      
                                      (beside (star 4 "solid" "navy")
                                              (star 4 "solid" "navy")))
  
                               (rectangle (* HEIGHT 0.76) (* HEIGHT 0.5385) "solid" "navy")))




(define blank (rectangle WIDTH HEIGHT "outline" "black"))


(define blue-flag (put-image blue-and-star
                             (/ WIDTH 4.96) (/ HEIGHT 1.375)
                           blank))


(define half-american-flag (put-image (above (rectangle 340 (* HEIGHT 1/13) "solid" "red")
                                             (rectangle 340 (* HEIGHT 1/13) "solid" "white")
                                             (rectangle 340 (* HEIGHT 1/13) "solid" "red")
                                             (rectangle 340 (* HEIGHT 1/13) "solid" "white")
                                             (rectangle 340 (* HEIGHT 1/13) "solid" "red")
                                             (rectangle 340 (* HEIGHT 1/13) "solid" "white")
                                             (rectangle 340 (* HEIGHT 1/13) "solid" "red"))
                                 (/ WIDTH 1.43) (/ HEIGHT 1.375)
                                 blue-flag))


(define American-Flag (put-image (above (rectangle 568 (* HEIGHT 1/13) "solid" "white")
                                        (rectangle 568 (* HEIGHT 1/13) "solid" "red")
                                        (rectangle 568 (* HEIGHT 1/13) "solid" "white")
                                        (rectangle 568 (* HEIGHT 1/13) "solid" "red")
                                        (rectangle 568 (* HEIGHT 1/13) "solid" "white")
                                        (rectangle 568 (* HEIGHT 1/13) "solid" "red"))
                                 (/ WIDTH 2) (/ HEIGHT 4.3)
                                 half-american-flag))


American-Flag