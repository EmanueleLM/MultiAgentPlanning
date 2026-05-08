(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    x1y1 x2y1 x3y1 ... x99y1 x1y2 x2y2 ... x99y2 x1y3 x2y3 ... x99y3 - location
    player1 - player
    box1 - box
  )
  (:init
    (at player1 x99y2)
    (at box1 x47y2)
    (is-goal x2y2)
    (adjacent x1y2 x2y2) (adjacent x2y2 x1y2) ... (adjacent x98y2 x99y2) 
    (is-free x2y2) (is-free x3y2) ... (is-free x98y2)
    (not (is-free x1y1)) (not (is-free x2y1)) ... (not (is-free x99y2))
  )
  (:goal
    (box-on-goal box1)
  )
)