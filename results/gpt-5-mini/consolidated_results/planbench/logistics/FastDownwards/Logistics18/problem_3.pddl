(define (problem task-instance-1)
  (:domain objects-manipulation)
  (:objects
    ;; domain objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj

    ;; explicit discrete time stages: provide enough successive stages to allow
    ;; the planned number of ordered actions. (Here we expose 13 stages.)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 - time
  )
  (:init
    ;; Initial facts from statement block 1 (preserved exactly)
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    (next object_0 object_8)
    (next object_1 object_8)
    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)
    (next object_4 object_7)
    (next object_5 object_9)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; time successor chain to enforce ordered action application
    (time-next stage_0 stage_1)
    (time-next stage_1 stage_2)
    (time-next stage_2 stage_3)
    (time-next stage_3 stage_4)
    (time-next stage_4 stage_5)
    (time-next stage_5 stage_6)
    (time-next stage_6 stage_7)
    (time-next stage_7 stage_8)
    (time-next stage_8 stage_9)
    (time-next stage_9 stage_10)
    (time-next stage_10 stage_11)
    (time-next stage_11 stage_12)

    ;; initial current time
    (current stage_0)
  )
  (:goal (and
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
  ))
)