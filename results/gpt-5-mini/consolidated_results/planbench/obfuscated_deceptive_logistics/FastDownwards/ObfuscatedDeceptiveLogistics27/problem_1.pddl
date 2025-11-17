(define (problem obfuscated-deceptive-logistics27-problem)
  (:domain obfuscated-deceptive-logistics27)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; properties
    (cats object_0)
    (cats object_1)

    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    (hand object_12)
    (hand object_13)
    (hand object_14)

    ;; next links (initial)
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  ;; Goal: reach these next links (the planned sequence should achieve them)
  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))

  ;;; Assumptions / comments:
  ;;; - The domain actions correspond exactly to the public action templates supplied in the task.
  ;;; - There are no hidden constraints beyond the predicates given; multiple hands may point to the same target.
  ;;; - Actions are instantaneous classical STRIPS actions; no durative constructs are used.
  ;;; - The provided initial facts and goal correspond to the first variant in the raw description.
)