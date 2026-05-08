(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    cell11 cell12 cell21 - position
    player_entity - player
    box_entity - box
    goal_position - goal
  )

  (:init
    (at player player_entity cell11)
    (at box box_entity cell13)
    (is_goal cell12)
    (adjacent cell11 cell12)
    (adjacent cell12 cell13)
    (clear cell13)
  )

  (:goal
    (at box_entity cell12)
  )
)