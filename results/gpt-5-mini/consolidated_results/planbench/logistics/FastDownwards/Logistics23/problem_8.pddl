(define (problem Logistics23_problem_fragment1_staged)
  (:domain Logistics23)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
    stage_0 stage_1 stage_2 - stage
  )

  (:init
    ;; contiguous stage ordering required by several actions (sa -> sb -> sc)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)

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

    ;; Explicit at-stage assignment for every object to satisfy action preconditions that
    ;; require contiguous stage occupancy. These assignments make each (next X Y) consistent
    ;; with X being at a stage immediately before Y.
    ;; stage_0: sources for next -> stage_1 targets
    (at-stage object_3 stage_0)
    (at-stage object_4 stage_0)
    (at-stage object_12 stage_0)

    ;; stage_1: targets of stage_0 and sources for stage_2
    (at-stage object_10 stage_1)
    (at-stage object_11 stage_1)
    (at-stage object_7 stage_1)
    (at-stage object_0 stage_1)

    ;; stage_2: targets for stage_1
    (at-stage object_6 stage_2)
    (at-stage object_8 stage_2)
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