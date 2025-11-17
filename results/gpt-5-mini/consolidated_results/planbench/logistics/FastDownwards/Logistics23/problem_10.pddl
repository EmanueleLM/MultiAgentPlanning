(define (problem Logistics23_problem_fragment1)
  (:domain Logistics23)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    ;; explicit ordered stages (solver must respect these objects/predicates; actions do not alter them)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)

    ;; Provided initial facts (fragment 1)
    (cats object_0)

    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (hand object_11)
    (hand object_12)

    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_8)
    )
  )
)