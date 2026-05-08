(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_t
    box1 - box_t
    start_pos goal_pos wall1 wall2 - position_t
    empty1 empty2 empty3 - position_t
  )

  (:init
    (at_player start_pos)
    (at_box box1 empty1)
    (is_goal goal_pos)
    (adjacent start_pos empty1)
    (adjacent empty1 empty2)
    (adjacent empty2 goal_pos)
    (adjacent start_pos wall1)
    (adjacent empty2 wall2)
    (is_empty start_pos)
    (is_empty empty1)
    (is_empty empty2)
    (is_wall wall1)
    (is_wall wall2)
  )

  (:goal
    (at_box box1 goal_pos)
  )
)