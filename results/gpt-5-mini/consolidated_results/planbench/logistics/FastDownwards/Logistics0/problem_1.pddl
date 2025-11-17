(define (problem make-next-object_8-object_6)
  (:domain orchestrator-next-link)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    s0 s1 s2 s3 s4 - stage
    paltry sip clip wretched memory tightfisted - act
  )

  (:init
    ; world facts (from the first provided statement block)
    (cats object_0)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_3)
    (hand object_8)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (sneeze object_4)
    (sneeze object_5)
    (spring object_6)
    (spring object_7)
    (stupendous object_2)
    (stupendous object_3)
    (texture object_6)
    (texture object_7)

    ; stage topology and current stage
    (succ-stage s0 s1)
    (succ-stage s1 s2)
    (succ-stage s2 s3)
    (succ-stage s3 s4)
    (current-stage s0)

    ; allowed action slots encode the required ordering
    ; This encodes the intended ordering: memory @ s0 -> sip @ s1 -> memory @ s2 -> paltry @ s3
    (allowed-at memory s0)
    (allowed-at sip s1)
    (allowed-at memory s2)
    (allowed-at paltry s3)
  )

  (:goal (and
    (next object_8 object_6)
  ))
)