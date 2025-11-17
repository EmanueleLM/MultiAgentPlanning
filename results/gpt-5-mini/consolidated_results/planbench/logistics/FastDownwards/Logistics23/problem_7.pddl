(define (problem Logistics23_problem_fragment1_staged)
  (:domain Logistics23)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    ;; explicit stage successor chain (contiguous ordering)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)

    ;; initial facts from the provided fragment (kept as given)
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

    ;; at-stage assignments chosen to satisfy the contiguous-stage requirements
    ;; for actions that require next(X,Y): X is at a stage immediately before Y.
    ;; Mapping selected to keep the provided initial (next ...) facts consistent:
    ;; - Pairs involving object_10 as target: object_12 and object_4 are placed one stage before object_10.
    ;; - Pairs involving object_6 as target: object_11 is placed one stage before object_6.
    ;; - Pair next object_3 object_7: object_3 is placed one stage before object_7.
    ;; - Pair next object_0 object_8: object_0 is placed one stage before object_8.
    (at-stage object_3 stage_0)
    (at-stage object_4 stage_0)
    (at-stage object_12 stage_0)

    (at-stage object_10 stage_1)
    (at-stage object_11 stage_1)
    (at-stage object_7 stage_1)
    (at-stage object_0 stage_1)

    (at-stage object_6 stage_2)
    (at-stage object_8 stage_2)

    ;; other objects placed at stage_2 for availability (no contradictory next facts)
    (at-stage object_1 stage_2)
    (at-stage object_2 stage_2)
    (at-stage object_5 stage_2)
    (at-stage object_9 stage_2)
  )

  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_8)
    )
  )
)