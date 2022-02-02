(triangle 100 "solid" "turquoise")

(ellipse 100 50 "solid" "olive")

(ellipse 50 100 "solid" "olive")

(line 150 1 "magenta")

(line 150 150 "gold")

(overlay (star 20 5 10 "solid" "purple")
         
         (star 20 15 20 "solid" "indigo") 
         
         (star 20 25 30 "solid" "blue")
         
         (star 20 35 40 "solid" "green")
         
         (star 20 45 50 "solid" "yellow")
         
         (star 20 55 60 "solid" "orange")
         
         (star 20 65 70 "solid" "red"))

(place-image (circle 20 "solid" "blue")
             50 50
             (circle 50 "solid" "red"))

(ellipse 100 50 "outline" "black")

(ellipse 50 100 "outline" "blue")


(triangle 100 "solid" "green")

(right-triangle 50 100 "solid" "black")

(isosceles-triangle 200 100 "solid" "olive")

(square 100 "solid" "yellow")

(square 50 "outline" "magenta")

(rhombus 100 100 "solid" "magenta")

(rhombus 100 50 "outline" "blue")

(circle 50 "solid" "black")

(rectangle 100 50 "outline" "orange")

(rectangle 50 100 "solid" "blue")

(regular-polygon 50 10 "outline" "red")

(regular-polygon 50 7 "solid" "blue")

(regular-polygon 100 3 "solid" "orange")

(star 50 "solid" "gray")

(star 3 50 5 "solid" "yellow")

(star 5 50 17 "solid" "green")

(star 20 50 20 "solid" "black")

(polygon (list (make-posn -10 0)
               
               (make-posn -40 30)
               
               (make-posn 90 0)
               
               (make-posn -40 -30))
         
               "solid" "brown")

(polygon (list (make-posn 0 0)
               
               (make-posn 0 15)
               
               (make-posn 15 15)
               
               (make-posn 15 25)
               
               (make-posn 20 5)
               
               (make-posn 15 -10)
               
               (make-posn 15 0))
         
               "solid" "blue")

(line 50 50 "black")

(line 50 50 "black")

(line -50 50 "red")

(line -50 50 "red")

(text "Hello" 50 "blue")

(text "Goodbye" 40 "red")

(overlay (rectangle 30 60 "solid" "blue")
         
         (ellipse 60 30 "solid" "yellow"))



(overlay (ellipse 10 10 "solid" "red")
         (ellipse 20 20 "solid" "black")
         (ellipse 30 30 "solid" "red")
         (ellipse 40 40 "solid" "black")
         (ellipse 50 50 "solid" "red")
         (ellipse 60 60 "solid" "black"))




(overlay/align "left" "middle"
                 (rectangle 30 60 "solid" "orange")
                 (ellipse 60 30 "solid" "purple"))

(overlay/xy (rectangle 20 20 "outline" "black")
            20 0
            (rectangle 20 20 "outline" "black"))

(overlay/xy (rectangle 20 20 "solid" "red")
            20 20
            (rectangle 20 20 "solid" "black"))

(overlay/xy (rectangle 20 20 "solid" "red")
            -20 -20
            (rectangle 20 20 "solid" "black"))

(overlay/xy
 (overlay/xy (ellipse 40 40 "outline" "black")
             10
             15
             (ellipse 10 10 "solid" "forestgreen"))
 20
 15
 (ellipse 10 10 "solid" "forestgreen"))   




(underlay (rectangle 30 60 "solid" "orange")
          (ellipse 60 30 "solid" "purple"))
(underlay (ellipse 10 60 "solid" "red")
          (ellipse 20 50 "solid" "black")
          (ellipse 30 40 "solid" "red")
          (ellipse 40 30 "solid" "black")
          (ellipse 50 20 "solid" "red")
          (ellipse 60 10 "solid" "black"))
(underlay/align "left" "middle"
                  (rectangle 30 60 "solid" "orange")
                  (ellipse 60 30 "solid" "purple"))


(underlay/xy (rectangle 20 20 "outline" "black")
             20 0
             (rectangle 20 20 "outline" "black"))

(underlay/xy (rectangle 20 20 "solid" "red")
             20 20
             (rectangle 20 20 "solid" "black"))

(underlay/xy (rectangle 20 20 "solid" "red")
             -20 -20
             (rectangle 20 20 "solid" "black"))

(underlay/xy
 (underlay/xy (ellipse 40 40 "solid" "gray")
              10
              15
              (ellipse 10 10 "solid" "forestgreen"))
 20
 15
 (ellipse 10 10 "solid" "forestgreen")) 



(beside (ellipse 20 70 "solid" "gray")
          (ellipse 20 50 "solid" "darkgray")
          (ellipse 20 30 "solid" "dimgray")
          (ellipse 20 10 "solid" "black"))

(beside/align "bottom"
                (ellipse 20 70 "solid" "lightsteelblue")
                (ellipse 20 50 "solid" "mediumslateblue")
                (ellipse 20 30 "solid" "slateblue")
                (ellipse 20 10 "solid" "navy"))


(above (ellipse 70 20 "solid" "gray")
         (ellipse 50 20 "solid" "darkgray")
         (ellipse 30 20 "solid" "dimgray")
         (ellipse 10 20 "solid" "black"))


(above/align "right"
               (ellipse 70 20 "solid" "gold")
               (ellipse 50 20 "solid" "goldenrod")
               (ellipse 30 20 "solid" "darkgoldenrod")
               (ellipse 10 20 "solid" "sienna"))


(empty-scene 160 90)



(place-image
 (triangle 32 "solid" "red")
 24 24
 (rectangle 48 48 "solid" "gray"))


(place-image
 (triangle 64 "solid" "red")
 24 24
 (rectangle 48 48 "solid" "gray"))


(place-image
 (circle 4 "solid" "white")
 18 20
 (place-image
  (circle 4 "solid" "white")
  0 6
  (place-image
   (circle 4 "solid" "white")
   14 2
   (place-image
    (circle 4 "solid" "white")
    8 14    (rectangle 24 24 "solid" "goldenrod")))))


(place-image/align (triangle 48 "solid" "yellowgreen")
                     64 64 "right" "bottom"
                     (rectangle 64 64 "solid" "mediumgoldenrod"))


(scene+line (ellipse 40 40 "outline" "maroon")
              0 40 40 0 "maroon")


(rotate 45 (ellipse 60 20 "solid" "olivedrab"))
(scale 2 (ellipse 20 30 "solid" "blue"))

(scale/xy 3
            2
            (ellipse 20 30 "solid" "blue"))
(crop 0 0 40 40 (circle 40 "solid" "chocolate"))

(frame (ellipse 20 20 "outline" "black"))

(check-expect (image-width (ellipse 30 40 "solid" "orange"))
              30)
(check-expect (image-width (circle 30 "solid" "orange")) 
              60)
(check-expect (image-width (rectangle 0 10 "solid" "purple"))
              0)

(check-expect (image-height (ellipse 30 40 "solid" "orange"))
              40)
(check-expect (image-height (circle 30 "solid" "orange"))
              60)
(check-expect (image-height (overlay (circle 20 "solid" "orange")
                                     (circle 30 "solid" "purple")))
              
              60)
(check-expect (image-height (rectangle 10 0 "solid" "purple"))
              0)

(image-baseline (text "Hello" 24 "black"))

(image-color? "magenta")

(radial-star 10 15 100 "solid" "darkslategray")

(star-polygon 40 20 9 "outline" "darkred")