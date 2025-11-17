(define (problem mysteryblocksworld19-problem-next-11-10)
  (:domain MysteryBlocksworld19)

  ;; Objects
  (:objects
    object_0 object_1 object_2 object_3 object_4
    object_5 object_6 object_7 object_8 object_9
    object_10 object_11 - obj
  )

  ;; Initial state (taken from the first scenario in the human specification)
  (:init
    ;; unary properties
    (cats object_0)
    (hand object_11)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)

    ;; textures
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations (static)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (mutable)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_3 object_7)
    (next object_4 object_8)
  )

  ;; Goal: achieve next object_11 object_10
  ;; Note: The provided proposed solution (in <proposed_solution>) is a valid sequence
  ;; under these initial facts and the action schemas. This problem encodes the
  ;; same initial state and goal to allow verification by a planner.
  (:goal (and
    (next object_11 object_10)
  ))
)