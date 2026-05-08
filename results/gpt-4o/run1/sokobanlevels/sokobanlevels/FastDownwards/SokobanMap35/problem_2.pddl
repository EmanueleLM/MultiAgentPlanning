(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    p0 p1 p2 p3 p4 p5 p6 p7 p8 - position
  )
  (:init
    (player-at p0)
    (box-at box1 p3)
    (goal-at goal1 p8)

    (is-clear p1) (is-clear p2) (is-clear p4) (is-clear p5) (is-clear p6) (is-clear p7) (is-clear p8)

    (adjacent p0 p1) (adjacent p1 p0)
    (adjacent p1 p2) (adjacent p2 p1)
    (adjacent p2 p3) (adjacent p3 p2)
    (adjacent p3 p4) (adjacent p4 p3)
    (adjacent p4 p5) (adjacent p5 p4)
    (adjacent p5 p6) (adjacent p6 p5)
    (adjacent p6 p7) (adjacent p7 p6)
    (adjacent p7 p8) (adjacent p8 p7)
  )
  (:goal
    (box-at box1 p8)
  )
)