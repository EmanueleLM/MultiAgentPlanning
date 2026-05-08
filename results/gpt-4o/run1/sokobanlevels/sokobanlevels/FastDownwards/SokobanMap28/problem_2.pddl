(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_t
    box - box_t
    pos_goal pos_box pos_player - pos_t
  )

  (:init
    (at_player pos_player)
    (at_box box pos_box)
    (is_goal pos_goal)
    (adjacent pos_box pos_goal)
    (adjacent pos_goal pos_player)
    (is_empty pos_goal)
    (is_empty pos_player)
  )

  (:goal
    (at_box box pos_goal)
  )
)