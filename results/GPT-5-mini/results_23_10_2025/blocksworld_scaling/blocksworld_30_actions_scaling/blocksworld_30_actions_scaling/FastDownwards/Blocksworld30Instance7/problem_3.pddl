(define (problem blocksworld30instance7)
  (:domain blocksworld_sequence)
  (:objects
    a b c d e f g h i j
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
  )

  (:init
    ;; initial "on" relations (lowercase)
    (on a j)
    (on f a)
    (on g f)
    (on h g)
    (on d h)
    (on b e)

    ;; what's on the table initially
    (ontable e)
    (ontable c)
    (ontable i)
    (ontable j)

    ;; clear blocks (those with nothing on them initially)
    (clear d)
    (clear b)
    (clear c)
    (clear i)

    ;; gripper is empty at start
    (handempty)

    ;; sequencing starts at step0
    (current-step step0)
  )

  ;; Goal: complete the 30-step prescribed sequence (verifies feasibility).
  (:goal (current-step step30))
)