(define (problem objects-problem)
  (:domain objects-domain)
  ;; Objects: unified set taken from analysts' inputs
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13
  )

  ;; Assumptions / reconciliation notes:
  ;; - This problem uses the initial facts and goal set reported by analyst_A because analyst_A provided
  ;;   a detailed, internally consistent plan that reaches the listed goals. Analyst_B reported a different
  ;;   initial fact set and a different goal and concluded unreachability under that alternative state.
  ;; - We therefore assume analyst_A's S0 is authoritative for the intended planning instance.
  ;; - No additional facts were invented; all predicates and actions match the analysts' schemas.
  ;; - If you intended analyst_B's alternative initial facts or goal (next object_11 object_10), please
  ;;   inform me and I will produce a variant problem encoding those facts instead.

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect facts
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hands
    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; next relations (initial)
    (next object_0 object_8)
    (next object_1 object_8)
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)
    (next object_4 object_7)
    (next object_5 object_9)

    ;; sneezes
    (sneeze object_4)
    (sneeze object_5)

    ;; springs
    (spring object_6)
    (spring object_8)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; textures
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal (and
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)