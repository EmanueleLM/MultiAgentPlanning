(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player_pos_101 - position
    box_pos_49 - position
    goal_pos_1 - position
    ; wall and other positions are inferred and listed below
  )
  (:init
    (at_player player_pos_101)
    (at_box box_pos_49)
    (is_goal goal_pos_1)

    (is_wall position_0) (is_wall position_2) (is_wall position_3) ; ...
    (is_wall position_98) (is_wall position_99) (is_wall position_100) ; ...
    (is_wall position_102) ; ... and conclude for all necessary wall positions

    (adjacent player_pos_101 player_pos_100)
    (adjacent player_pos_100 box_pos_49)
    (adjacent box_pos_49 position_48) ; complete all necessary adjacencies
    ; assume all other position adjacencies that form a path between start and goal
  )
  (:goal
    (at_box goal_pos_1)
  )
)