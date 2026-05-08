(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    t1 t2 t3 t4 t5 t6 - tile
  )
  (:init
    (at player1 t1)
    (at box1 t5)
    (is_goal box1 goal1)

    ;; Define walkable adjacencies (tiles without walls)
    (adjacent t1 t2) (adjacent t2 t3) (adjacent t3 t4)
    (adjacent t4 t5) (adjacent t5 t6) 

    ;; Goal location
    (at goal1 t6)
  )
  (:goal
    (at box1 goal1) ; Goal condition matched: box should be at the goal location
  )
)