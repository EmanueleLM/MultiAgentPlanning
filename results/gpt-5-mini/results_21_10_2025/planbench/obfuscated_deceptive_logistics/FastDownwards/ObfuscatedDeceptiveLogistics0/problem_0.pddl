(define (problem orchestrated_problem)
  (:domain orchestrated_domain)
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )
  (:init
    ;; Scenario initialization encoded so that clip can directly achieve the goal:
    ;; object_8 is free (can be used as a source)
    ;; object_6 is already remembered (can be used as a target)
    (free object_8)
    (remembered object_6)

    ;; All other objects are initially free (not necessary but explicit)
    (free object_1)
    (free object_2)
    (free object_3)
    (free object_4)
    (free object_5)
    (free object_7)
  )
  (:goal (and
    (next object_8 object_6)
  ))
)