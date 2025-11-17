(define (problem obfuscated-deceptive-logistics27-problem)
  (:domain obfuscated-deceptive-logistics27)

  (:objects
    ;; typed objects (types encode attribute membership; we avoid repeating those as init facts)
    object_12 object_13 object_14 - hand
    object_0 object_1            - cat
    object_4 object_5            - sneeze
    object_2 object_3            - stupendous
    object_6 object_7 object_8 object_9 object_10 object_11 - texture
  )

  (:init
    ;; explicitly only the non-type relations required by the domain/task
    ;; collect facts (needed by wretched)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (collect object_10 object_3)
    (collect object_11 object_3)

    ;; spring facts (used by memory)
    (spring object_6)
    (spring object_9)

    ;; initial next relations (canonicalized)
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)
  )

  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
)