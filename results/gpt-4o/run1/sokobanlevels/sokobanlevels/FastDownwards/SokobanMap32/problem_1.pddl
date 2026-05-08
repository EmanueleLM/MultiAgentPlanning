(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player_pos_101 - position
    box_pos_49 - position
    goal_pos_1 - position
    position_0 position_2 position_3 position_48 position_98 position_99 position_100 position_102 - position
    ; Define other positions as needed
  )
  (:init
    (at_player player_pos_101)
    (at_box box_pos_49)
    (is_goal goal_pos_1)

    (is_wall position_0) (is_wall position_2) (is_wall position_3)
    (is_wall position_98) (is_wall position_99) (is_wall position_100)
    (is_wall position_102)

    (adjacent player_pos_101 player_pos_100)
    (adjacent player_pos_100 box_pos_49)
    (adjacent box_pos_49 position_48)
    ; Add all necessary adjacencies
  )
  (:goal
    (at_box goal_pos_1)
  )
)