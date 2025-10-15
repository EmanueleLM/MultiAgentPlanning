(define (problem joint_problem)
  (:domain joint_domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - object
  )

  (:init
    ;; player_a private facts
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (hand object_11)
    (hand object_12)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; player_b private facts
    (cats object_1)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_13)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)
    (sneeze object_5)
    (spring object_6)
    (spring object_9)
    (stupendous object_3)
    (texture object_10)  ;; already present from player_a; duplicates are harmless
    (texture object_11)
    (texture object_6)   ;; duplicates allowed
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; Note: No vase facts present initially unless derived by actions.
    ;; The union of both agents' private facts is used as the initial state.
  )

  ;; Combined goal: both agents' local goals must be achieved.
  (:goal (and
    (next object_11 object_7)   ;; player_a goal
    (next object_12 object_8)   ;; player_a goal
    (next object_12 object_10)  ;; player_b goal
    (next object_13 object_9)   ;; player_b goal
  ))
)