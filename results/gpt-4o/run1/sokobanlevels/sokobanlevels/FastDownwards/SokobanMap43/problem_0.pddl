(define (problem sokoban-instance)
  (:domain sokoban)
  
  (:objects
    player - player
    box_1 - box
    goal_1 - goal
    loc_00 loc_01 loc_02 loc_03 loc_04 loc_05 loc_06 loc_07 loc_08 loc_09 loc_10
    loc_11 loc_12 loc_13 loc_14 loc_15 loc_16 loc_17 loc_18 loc_19 loc_20
    (... list all locations up to loc_1499 ...)
    wall_0 wall_1 wall_2 wall_3 wall_4 wall_5 wall_6 wall_7 wall_8 wall_9 wall_10
    wall_11 wall_12 wall_13 wall_14 wall_15 wall_16 wall_17 wall_18 wall_19 wall_20
    (... list all walls ...)
    - location
  )
  
  (:init
    (at_player loc_00)
    (at_box box_1 loc_50)
    (at_goal goal_1 loc_1499)
    (player_on_goal loc_1499)
    ; Specify all clear locations and adjacency relations...
    ; Walls would remove the 'clear' predicate from their location...
    ; For example:
    (clear loc_01)
    (adjacent loc_00 loc_01)
    (adjacent loc_00 loc_10)
    (adjacent loc_50 loc_51)
    (adjacent loc_50 loc_40)
    ; Continue for all relevant locational relationships based on map...
  )
  
  (:goal
    (box_on_goal box_1)
  )
)