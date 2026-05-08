(define (problem make-specified-nexts-explicit-stages)
  (:domain object-ordering-explicit-stages)

  (:objects
    ;; domain objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object

    ;; explicit discrete stages (one start stage + several consumable stages)
    st0_start st1 st2 st3 st4 st5 st6 - stage
  )

  (:init
    ;; Initial facts from the specification
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

    ;; Stage ordering: contiguous linear progression from st0_start -> st1 -> st2 -> ...
    (next-stage st0_start st1)
    (next-stage st1 st2)
    (next-stage st2 st3)
    (next-stage st3 st4)
    (next-stage st4 st5)
    (next-stage st5 st6)

    ;; Stage availability: the start stage is considered already used;
    ;; all subsequent stages are initially free and must be consumed in order.
    (used-stage st0_start)
    (free-stage st1)
    (free-stage st2)
    (free-stage st3)
    (free-stage st4)
    (free-stage st5)
    (free-stage st6)
  )

  (:goal (and
    (next object_10 object_8)
    (next object_11 object_7)
    (next object_9 object_6)
  ))
)