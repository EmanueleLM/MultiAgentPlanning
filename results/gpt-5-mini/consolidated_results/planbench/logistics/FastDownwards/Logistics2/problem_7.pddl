(define (problem scenario_1)
  (:domain next-vase-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 - stage
  )
  (:init
    ;; facts
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)

    ;; stage ordering (discrete time)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)

    ;; initial current stage
    (now stage_0)
  )
  (:goal (and (next object_7 object_6) (next object_8 object_6)))
)