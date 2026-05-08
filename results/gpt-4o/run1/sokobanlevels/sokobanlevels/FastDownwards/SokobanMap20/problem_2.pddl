(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - player
    box1 - box
    goal1 - tile
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 - tile
  )
  (:init
    (at player1 t48)
    (at box1 t46)

    ;; The goal for this instance
    (is_goal box1 t2)

    ;; Define walkable adjacencies (tiles without walls)
    (adjacent t2 t3) (adjacent t3 t4) (adjacent t4 t5)
    (adjacent t5 t6) (adjacent t6 t7) (adjacent t7 t8) 
    (adjacent t46 t47) (adjacent t47 t48)            

    ;; Adding adjacency for necessary moves
    (adjacent t2 t3) ; Example continuation, complete these as needed
    ;; (Complete necessary adjacencies based on problem layout)
  )
  (:goal
    (and 
      (is_goal box1 t2) ; Goal condition matched to box at goal position
    )
  )
)