(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    x2y2 - location
    x47y2 - location
    x98y2 x99y2 - location
    player1 - player
    box1 - box
  )
  (:init
    (at player1 x99y2)
    (at box1 x47y2)
    (is-goal x2y2)
    (is-free x98y2)

    ;; Adjacency for linear movement capability
    (adjacent x47y2 x48y2) (adjacent x48y2 x47y2)
    (adjacent x48y2 x49y2) (adjacent x49y2 x48y2)
    (adjacent x99y2 x98y2) (adjacent x98y2 x99y2)
    ;; Continue this pattern as per the map layout for free spaces.
  )
  (:goal
    (box-on-goal box1)
  )
)