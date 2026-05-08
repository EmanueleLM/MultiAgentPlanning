(define (problem orchestrator-problem)
  (:domain orchestrator)

  ; Objects: object_0 .. object_13 as provided by analyst initial facts
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13
  )

  ; Initial facts exactly as enumerated by the analyst (no invented facts).
  (:init
    ; Type-like unary predicates
    (cat object_0)
    (cat object_1)

    (stupendous object_2)
    (stupendous object_3)

    (sneeze object_4)
    (sneeze object_5)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)
    (texture object_11)

    (spring object_6)
    (spring object_9)

    (hand object_12)
    (hand object_13)

    ; Next relations (binary) from analyst initial Next pairs
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

    ; Collect relations (static binary facts) as provided
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ; No vase facts initially (explicit omission per analyst)
    ; (vase ...) none present initially
  )

  ; Goal: both Next(12,10) and Next(13,9) must hold (encoded as conjunction).
  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)