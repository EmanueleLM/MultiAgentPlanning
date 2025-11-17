(define (problem scenario1_obfuscated)
  (:domain obfuscated_deceptive_logistics7)

  (:objects
    ;; domain objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
    ;; explicit stages to enforce contiguous progression (enough stages for plans)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 - stage
  )

  (:init
    ;; current stage and successor chain (enforces contiguous stage advancement)
    (current_stage stage_0)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)

    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect relations
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hand
    (hand object_10)

    ;; next relations (initial)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_4 object_6)
    (next object_5 object_9)

    ;; sneezes
    (sneeze object_4)
    (sneeze object_5)

    ;; springs
    (spring object_6)
    (spring object_8)

    ;; stupendous
    (stupendous object_2)
    (stupendous object_3)

    ;; textures
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  ;; Goal: establish next object_10 object_6
  (:goal (and (next object_10 object_6)))
)