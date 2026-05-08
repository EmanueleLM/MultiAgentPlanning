(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    start end - position
  )
  (:init
    (player-at start)
    (box-at box1 start)
    (goal-at goal1 end)

    (is-clear end)

    (adjacent start end)
    (adjacent end start)
  )
  (:goal
    (and
      (box-at box1 end)
      (player-at end)
    )
  )
)