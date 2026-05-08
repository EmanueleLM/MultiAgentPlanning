(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    p0 p1 p2 p3 p4 p5 p6 p7 p8 - position
    player_entity - player
    box_entity - box
    goal_position - goal)

  (:init
    (at player_entity p7)
    (at box_entity p6)
    (goal p1)
    (adjacent p0 p1) (adjacent p1 p2)
    (adjacent p3 p4) (adjacent p4 p5)
    (adjacent p6 p7) (adjacent p7 p8)
    (clear p0) (clear p1) (clear p3) (clear p4)
    (clear p2) (clear p5))

  (:goal
    (box_at_goal box_entity goal_position))
)