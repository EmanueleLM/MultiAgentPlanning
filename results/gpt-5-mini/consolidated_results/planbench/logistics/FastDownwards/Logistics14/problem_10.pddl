(define (problem repoint-problem)
  (:domain repoint-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - item
    start stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 - stage
  )

  (:init
    ;; item predicates (from the first scenario statement)
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
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

    ;; stage declarations
    (is_stage start)
    (is_stage stage_0)
    (is_stage stage_1)
    (is_stage stage_2)
    (is_stage stage_3)
    (is_stage stage_4)
    (is_stage stage_5)
    (is_stage stage_6)
    (is_stage stage_7)
    (is_stage stage_8)
    (is_stage stage_9)
    (is_stage stage_10)
    (is_stage stage_11)
    (is_stage stage_12)
    (is_stage stage_13)
    (is_stage stage_14)

    ;; successor chain: start -> stage_0 -> stage_1 -> ...
    (succ start stage_0)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)
    (succ stage_7 stage_8)
    (succ stage_8 stage_9)
    (succ stage_9 stage_10)
    (succ stage_10 stage_11)
    (succ stage_11 stage_12)
    (succ stage_12 stage_13)
    (succ stage_13 stage_14)

    ;; availability tokens: all real stages initially available; 'start' is intentionally NOT available
    (available stage_0)
    (available stage_1)
    (available stage_2)
    (available stage_3)
    (available stage_4)
    (available stage_5)
    (available stage_6)
    (available stage_7)
    (available stage_8)
    (available stage_9)
    (available stage_10)
    (available stage_11)
    (available stage_12)
    (available stage_13)
    (available stage_14)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)