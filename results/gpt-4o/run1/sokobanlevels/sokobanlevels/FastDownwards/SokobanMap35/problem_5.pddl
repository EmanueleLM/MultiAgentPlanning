(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    start1 start2 goal1 - position
  )
  (:init
    (player-at start1)
    (box-at box1 start2)
    (goal-at goal1)

    (is-clear goal1)

    (adjacent start1 start2)
    (adjacent start2 start1)
    (adjacent start2 goal1)
    (adjacent goal1 start2)
  )
  (:goal
    (box-at box1 goal1)
  )
)