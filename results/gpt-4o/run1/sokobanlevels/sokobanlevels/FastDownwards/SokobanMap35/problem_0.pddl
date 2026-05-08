(define (problem sokoban-problem)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    p00 p01 p02 p10 p11 p12 p20 p21 p22 - position
  )
  (:init
    (player-at p01)
    (box-at box1 p35)
    (goal-at goal1 p97)

    (is-clear p00) (is-clear p01) (is-clear p02) 
    (is-clear p10) (is-clear p11) (is-clear p12) 
    (is-clear p20) (is-clear p21) (is-clear p22)

    (adjacent p01 p02) (adjacent p02 p01)
    (adjacent p01 p00) (adjacent p00 p01)
    (adjacent p10 p11) (adjacent p11 p10)
    (adjacent p11 p12) (adjacent p12 p11)
    (adjacent p20 p21) (adjacent p21 p20)
    (adjacent p21 p22) (adjacent p22 p21)
  )
  (:goal
    (box-at box1 p97)
  )
)