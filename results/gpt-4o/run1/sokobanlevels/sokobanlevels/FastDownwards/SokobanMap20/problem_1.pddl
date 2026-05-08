(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - goal
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 - tile
  )
  (:init
    (at player1 t27) ; player is initially at coordinate t27
    (at box1 t26) ; box is initially at coordinate t26
    (is_goal t5) ; goal is at coordinate t5

    ;; Define walkable spaces (tiles without walls)
    (empty t1) (empty t2) (empty t3) (empty t4) (empty t5) (empty t6) 
    (empty t7) (empty t8) (empty t9) (empty t10) (empty t11) (empty t12)
    (empty t13) (empty t14) (empty t15) (empty t16) (empty t17) (empty t18)
    (empty t19) (empty t20) (empty t21) (empty t22) (empty t23) (empty t24)
    (empty t25) (empty t26) (empty t27) (empty t28)

    ;; Define adjacencies, excluding walls
    (adjacent t1 t2) (adjacent t2 t3) (adjacent t3 t4) (adjacent t4 t5)
    (adjacent t5 t6) (adjacent t6 t7) (adjacent t7 t8) (adjacent t8 t9)
    (adjacent t9 t10) (adjacent t10 t11) 
    ;; Other adjacencies would be defined similarly
  )
  (:goal
    (and 
      (at box1 t5) ; box must be at the goal position
    )
  )
)