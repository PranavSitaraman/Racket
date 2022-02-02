(define keys (bitmap/url "http://www.101computing.net/wp/wp-content/uploads/arrowKeys.png"))

(define (which-key w key)
  (cond
    [(not (string? key)) w]
    [(string=? key "left")
     (text "You pressed the left key! I'm correct, right! Press another arrow key! Otherwise, press enter to return to the home screen!" 20 "black")]
    [(string=? key "right") 
    (text "You pressed the right key! I'm correct, right! Press another arrow key! Otherwise, press enter to return to the home screen!" 20 "black")]
    [(string=? key "down") 
     (text "You pressed the down key! I'm correct, right! Press another arrow key! Otherwise, press enter to return to the home screen!" 20 "black")]
    [(string=? key "up") 
     (text "You pressed the up key! I'm correct, right! Press another arrow key! Otherwise, press enter to return to the home screen!" 20 "black")]
    [(string=? key "\r")
     (above (text "Hi!!! My name is Bob! Please press one of the arrow keys, and I'll be able to guess which one you pressed!" 25 "black") (beside keys keys keys))]
    [else w]))

(define start (big-bang (above (text "Hi!!! My name is Bob! Please press one of the arrow keys, and I'll be able to guess which one you pressed!" 25 "black") (beside keys keys keys)) (on-key which-key)))

start