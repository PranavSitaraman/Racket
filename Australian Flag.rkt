(define HEIGHT 300)
(define WIDTH (* HEIGHT 2))


(define HEIGHT-2 150)
(define WIDTH-2 300)


(define blank-UK (rectangle WIDTH-2 HEIGHT-2 "solid" "white"))


(define Almost-UK (overlay (rectangle (* HEIGHT-2 1/5) HEIGHT-2 "solid" "red")
                    
                    (rectangle WIDTH-2 (* HEIGHT-2 1/5) "solid" "red")
                    
                    (rectangle (+ (* HEIGHT-2 1/5) (* HEIGHT-2 1/15) (* HEIGHT-2 1/15)) HEIGHT-2 "solid" "white")
                    
                    (rectangle WIDTH-2 (+ (* HEIGHT-2 1/5) (* HEIGHT-2 1/15) (* HEIGHT-2 1/15)) "solid" "white")
                           
                           (rotate 26 (rectangle 330 10 "solid" "red"))
                           (rotate -26 (rectangle 330 10 "solid" "red"))
                                        
                           blank-UK))


(define triangle1 (flip-horizontal (right-triangle 100 49 "solid" "navy")))


(define UK-1-triangle (put-image triangle1
                                 (/ WIDTH-2 3.9) (/ HEIGHT-2 5.8)
                                 Almost-UK))


(define triangle2 (flip-vertical (right-triangle 52 25 "solid" "navy")))


(define UK-2-triangles (put-image triangle2
                                  (/ WIDTH-2 11.5) (/ HEIGHT-2 3.9)
                                  UK-1-triangle))


(define triangle3 (right-triangle 70 34 "solid" "navy"))


(define UK-3-triangles (put-image triangle3
                                  (/ WIDTH-2 8.5) (/ HEIGHT-2 1.25)
                                  UK-2-triangles))


(define triangle4 (flip-horizontal (flip-vertical (right-triangle 81 40 "solid" "navy"))))


(define UK-4-triangles (put-image triangle4
                                  (/ WIDTH-2 3.5) (/ HEIGHT-2 1.14)
                                  UK-3-triangles))


(define triangle5 (flip-vertical (right-triangle 101 50 "solid" "navy")))


(define UK-5-triangles (put-image triangle5
                                  (/ WIDTH-2 1.34) (/ HEIGHT-2 1.17)
                                  UK-4-triangles))


(define triangle6 (flip-horizontal (right-triangle 55 27 "solid" "navy")))


(define UK-6-triangles (put-image triangle6
                                 (/ WIDTH-2 1.09) (/ HEIGHT-2 1.3)
                                 UK-5-triangles))


(define triangle7 (flip-horizontal (flip-vertical (right-triangle 74 35 "solid" "navy"))))


(define UK-7-triangles (put-image triangle7
                                  (/ WIDTH-2 1.13) (/ HEIGHT-2 4.3)
                                  UK-6-triangles))


(define triangle8 (right-triangle 90 45 "solid" "navy"))


(define UK-complete (put-image triangle8
                               (/ WIDTH-2 1.37) (/ HEIGHT-2 6.5)
                               UK-7-triangles))


(define blank (rectangle WIDTH HEIGHT "solid" "navy"))


(define australian-flag-with-no-stars (put-image UK-complete
                                                (/ WIDTH 3.99) (/ HEIGHT 1.33)
                                                blank))


(define star1 (radial-star 7 17 40 "solid" "white"))


(define australian-flag-with-1-star (put-image star1
                                              (/ WIDTH 4) (/ HEIGHT 3.9)
                                              australian-flag-with-no-stars))


(define star2 (radial-star 7 8 25 "solid" "white"))


(define australian-flag-with-2-stars (put-image star2
                                               (/ WIDTH 1.65) (/ HEIGHT 1.8)
                                               australian-flag-with-1-star))


(define star3 (radial-star 7 8 25 "solid" "white"))


(define australian-flag-with-3-stars (put-image star3
                                                (/ WIDTH 1.35) (/ HEIGHT 1.2)
                                                australian-flag-with-2-stars))


(define star4 (radial-star 7 8 25 "solid" "white"))


(define australian-flag-with-4-stars (put-image star3
                                                (/ WIDTH 1.15) (/ HEIGHT 1.6)
                                                australian-flag-with-3-stars))


(define star5 (radial-star 7 8 25 "solid" "white"))


(define australian-flag-with-5-stars (put-image star5
                                                (/ WIDTH 1.35) (/ HEIGHT 6)
                                                australian-flag-with-4-stars))


(define star6 (star 20 "solid" "white"))


(define Australian-Flag (put-image star6
                                   (/ WIDTH 1.25) (/ HEIGHT 2.2)
                                   australian-flag-with-5-stars))


Australian-Flag