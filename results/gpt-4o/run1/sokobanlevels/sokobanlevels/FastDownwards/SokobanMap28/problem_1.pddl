(define (problem sokoban-instance)
  (:domain sokoban)

  (:objects
    player - player_t
    box - box_t
    a b c d e f g goal - pos_t
  )

  (:init
    (at_player g)
    (at_box box e)
    (is_goal a)
    (adjacent g f)
    (adjacent f e)
    (adjacent e d)
    (adjacent d c)
    (adjacent c b)
    (adjacent b a)
    (is_empty f)
    (is_empty d)
    (is_empty c)
    (is_empty b)
    (is_goal a)
  )

  (:goal
    (at_box box a)
  )
)