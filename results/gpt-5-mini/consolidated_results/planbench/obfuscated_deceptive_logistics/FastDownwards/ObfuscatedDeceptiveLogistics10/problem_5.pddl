(define (problem orchestrated-problem)
  (:domain orchestrated)

  (:objects
    ;; Typed objects encode static roles so we do not need to assert those unary facts in :init
    object_0 - cat_t
    object_1 object_2 - stupendous_t
    object_3 object_4 - sneeze_t
    object_9 object_10 object_11 - hand_t

    ;; remaining objects (may play multiple unary roles such as texture and spring)
    object_5 object_6 object_7 object_8 - object
  )

  (:init
    ;; Binary/static facts (kept only those required by reachability and the domain)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; next-links present initially
    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)

    ;; multi-role unary predicates retained where overlap exists (texture and spring)
    (spring object_5)
    (spring object_7)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)