(define (problem scenario1_obfuscated_deceptive_logistics3)
  (:domain obfuscated-deceptive-logistics3)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    t0 t1 t2 t3 t4 t5 - stage
  )
  (:init
    ;; stage succession (explicit ordered stages)
    (succ t0 t1)
    (succ t1 t2)
    (succ t2 t3)
    (succ t3 t4)
    (succ t4 t5)

    ;; initial facts from first STATEMENT (time-indexed at stage t0 where appropriate)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)

    (next object_0 object_6 t0)
    (next object_3 object_5 t0)
    (next object_4 object_6 t0)
    (next object_7 object_6 t0)
    (next object_8 object_6 t0)

    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
  )
  (:goal (and
    ;; require the two target next facts at final stage t5
    (next object_7 object_5 t5)
    (next object_8 object_5 t5)
  ))
)