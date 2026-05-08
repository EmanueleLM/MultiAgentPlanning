(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    obj_a obj_b obj_c obj_d - object
  )
  (:init
    (craves obj_b obj_c)
    (craves obj_c obj_a)
    (harmony)
    (planet obj_a)
    (planet obj_d)
    (province obj_b)
    (province obj_d)
  )
  (:goal (and
    (craves obj_b obj_d)
    (craves obj_c obj_a)
  ))
)