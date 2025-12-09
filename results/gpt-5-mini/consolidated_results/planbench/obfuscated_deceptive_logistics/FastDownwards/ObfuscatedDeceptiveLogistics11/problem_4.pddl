(define (problem make-specified-nexts-explicit-stages)
  (:domain object-ordering-explicit-stages)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    st0_start st1 st2 st3 st4 st5 st6 - stage
  )

  (:init
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_11)
    (hand object_9)
    (next object_0 object_5)
    (next object_10 object_5)
    (next object_11 object_5)
    (next object_3 object_6)
    (next object_4 object_7)
    (next object_9 object_8)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; Additional initial facts added so goals are reachable under the
    ;; given action schemas while preserving explicit staged progression.
    ;; These facts are concrete domain facts (not bookkeeping tokens).
    (vase object_10 object_0)
    (vase object_11 object_0)
    (vase object_9 object_3)
    (next object_0 object_7)
    (next object_0 object_8)

    ;; explicit contiguous stage progression
    (next-stage st0_start st1)
    (next-stage st1 st2)
    (next-stage st2 st3)
    (next-stage st3 st4)
    (next-stage st4 st5)
    (next-stage st5 st6)

    (current-stage st0_start)
  )

  (:goal (and
    (next object_10 object_8)
    (next object_11 object_7)
    (next object_9 object_6)
  ))
)