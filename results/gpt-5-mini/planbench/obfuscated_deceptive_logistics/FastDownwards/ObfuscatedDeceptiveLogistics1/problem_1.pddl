(define (problem obfuscated_deceptive_logistics1-instance)
  (:domain obfuscated_deceptive_logistics1)

  ; Note: This problem uses the actions and predicates exactly as specified in the
  ; human description. The initial state and goal are encoded verbatim. Inspection
  ; of operators shows there is no operator that can create new sneeze facts or
  ; create certain collect/vase/cats combinations required to achieve the goal
  ; next object_8 object_6 from the given init. Therefore the instance is
  ; likely unsolvable under the exact operator set below; we keep the model
  ; faithful rather than silently repairing the problem.
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )

  (:init
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_5)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
  )

  (:goal (and
    (next object_7 object_6)
    (next object_8 object_6)
  ))
)