(define (problem Logistics23_problem_fragment1_staged)
  (:domain Logistics23)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - obj
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    ;; stage successor chain (explicit ordered stages)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)

    ;; initial static facts (from the provided fragment)
    (cats object_0)

    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (hand object_11)
    (hand object_12)

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

    ;; explicit next relations as given in the fragment
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)

    ;; at-stage assignments chosen to satisfy contiguous-stage requirements
    ;; and to make the provided plan fragment applicable:
    ;; Objects that are sources of (next X Y) are placed one stage before their targets.
    ;; To support wretched/memory (which require a three-stage chain) we place some targets
    ;; one stage further so succ relations hold when needed.
    ;; Mapping chosen:
    ;; stage_0: object_3, object_4, object_12
    ;; stage_1: object_10, object_11, object_7, object_0
    ;; stage_2: object_6, object_8
    ;; other objects placed at stage_2 to ensure defined occupancy
    (at-stage object_3 stage_0)
    (at-stage object_4 stage_0)
    (at-stage object_12 stage_0)

    (at-stage object_10 stage_1)
    (at-stage object_11 stage_1)
    (at-stage object_7 stage_1)
    (at-stage object_0 stage_1)

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