(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    p1 p2 p3 p4 - position
    player_entity - player
    box_entity - box
    goal_position - goal
  )

  (:init
    (at_player p4)
    (at_box p2)
    (goal p1)
    (adjacent p1 p2)
    (adjacent p2 p3)
    (adjacent p3 p4)
    (clear p1)
    (clear p3)
    (clear p4)
  )

  (:goal
    (at_box p1)
  )
)