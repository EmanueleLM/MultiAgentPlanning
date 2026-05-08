(define (problem obfuscated-deceptive-logistics-9-problem)
  (:domain obfuscated-deceptive-logistics-9)
  (:objects
    object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  (:init
    ;; necessary collects for wretched steps
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hands we will operate with
    (hand object_10)
    (hand object_11)

    ;; initial next links used by the plan
    (next object_10 object_6)
    (next object_11 object_9)
    (next object_4 object_6)
    (next object_5 object_8)

    ;; sneezes we will manipulate
    (sneeze object_4)
    (sneeze object_5)

    ;; stupendous markers required by wretched
    (stupendous object_2)
    (stupendous object_3)

    ;; textures needed by clip/wretched/tightfisted
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal
    (and
      (next object_10 object_7)
      (next object_11 object_8)
    )
  )
)