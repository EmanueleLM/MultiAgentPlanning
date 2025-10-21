(define (problem MysteryBlocksworld20-problem)
  (:domain MysteryBlocksworld20)

  ;; Comments / canonicalization choices:
  ;; - I combined the two STATEMENT fragments by taking the union of all initial facts provided.
  ;; - Objects are canonicalized as object_0 through object_12 (all objects referenced).
  ;; - The domain actions strictly follow the human specification; I did not invent actions that were not present.
  ;; - The planned solution in <proposed_solution> uses only actions defined in this domain and relies on the union of initial facts.

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
  )

  (:init
    ;; From STATEMENT 1 (actor_A fragment)
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (hand object_11)
    (next object_0 object_5)
    (next object_11 object_8)
    (next object_3 object_5)
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

    ;; From STATEMENT 2 (actor_B fragment)
    (cats object_0)
    (cats object_1)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_12)
    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_10)
    (next object_4 object_7)
    (next object_5 object_9)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_9)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; Note: duplicates above (e.g., texture object_10, sneeze object_4, cats object_0) are intentional and reflect the union of fragments.
  )

  (:goal (and
    (next object_11 object_9)
    (next object_12 object_11)
  ))
)