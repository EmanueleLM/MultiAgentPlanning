(define (problem orchestrated-problem)
  (:domain orchestrated-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - object
  )

  (:init
    ; unary type-like predicates (static)
    (cats object_0)
    (cats object_1)

    (hand object_10)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ; collect relations
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ; next relations (functional on first arg as invariant)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_4 object_6)
    (next object_5 object_9)

    ; no startled facts initially (none listed)
  )

  ; Goal: enforce that object_10's successor is object_6
  (:goal (and
    (next object_10 object_6)
  ))
)