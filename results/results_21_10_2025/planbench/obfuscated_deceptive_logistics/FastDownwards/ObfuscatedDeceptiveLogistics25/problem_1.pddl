(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  ;; objects: object_0 through object_13
  (:objects
    object_0 object_1 object_2 object_3 object_4
    object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; Initial facts (first scenario from the human specification)

    ;; cats
    (cats object_0)

    ;; collects
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; hands
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; next relations
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)

    ;; sneezes
    (sneeze object_3)
    (sneeze object_4)

    ;; springs
    (spring object_5)
    (spring object_8)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ;; textures
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  ;; Goal: verify whether the validated plan produces these target next relations.
  ;; (The plan itself is not encoded in the goal; the planner should be able to find
  ;; a sequence of actions that achieves the goal if one exists.)
  (:goal
    (and
      (next object_11 object_8)
      (next object_12 object_8)
      (next object_13 object_10)
    )
  )

  ;;; Notes / short comments:
  ;;; - This problem encodes the first scenario's initial state and goal set from the specification.
  ;;; - A provided plan (recorded in the proposed_solution tag) has been validated by stepwise simulation and
  ;;;   indeed achieves the goal triple from this initial state.
  ;;; - The specification also contains a second scenario with different initial facts and goals (no explicit plan).
  ;;;   That second scenario is not encoded in this problem file; it is noted here for completeness.
)