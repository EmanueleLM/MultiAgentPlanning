(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )
  (:init
    ;; All objects start free (available to participate in actions)
    (free object_0)
    (free object_1)
    (free object_2)
    (free object_3)
    (free object_4)
    (free object_5)
    (free object_6)
    (free object_7)
    (free object_8)
  )
  (:goal (and
    (next object_8 object_6)
  ))
)