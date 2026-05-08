(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    ;; Wall tiles are not explicitly needed as objects, we only use their coordinates.
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 
    t11 t12 t13 t14 t15 t16 t17 t18 t19 
    t20 t21 t22 t23 t24 t25 t26 t27 t28 - tile
  )
  (:init
    (at_player player1 t27) ; player is initially at coordinate with @
    (at_box box1 t27) ; box is initially at coordinate with $
    (is_goal t10) ; goal is at coordinate with .

    ;; Define adjacencies (connectivity) explicitly, excluding wall positions
    (adjacent t1 t2) (adjacent t2 t1)
    (adjacent t2 t3) (adjacent t3 t2)
    ;; Define other necessary adjacencies between walkable (tile) coordinates
    ;; More would be added here to reflect the Sokoban map provided.
  )
  (:goal
    (at_box box1 t10) ; box must be at the goal position (coordinate .)
  )
)