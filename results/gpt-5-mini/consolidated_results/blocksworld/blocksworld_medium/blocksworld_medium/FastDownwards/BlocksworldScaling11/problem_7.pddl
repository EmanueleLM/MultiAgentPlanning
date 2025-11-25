(define (problem blocks-stack-blue-yellow-red)
  (:domain blocks)
  (:objects
    blue yellow red orange - block
    h - hand
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - stage
  )
  (:init
    ;; spatial relations
    (on blue red)
    (ontable red)
    (ontable orange)
    (ontable yellow)

    ;; clear status: blocks with nothing on top and not held
    (clear blue)
    (clear orange)
    (clear yellow)

    ;; hand status
    (handempty h)

    ;; start stage
    (current stage0)

    ;; explicit successor chain to enforce contiguous stage progression
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
  )
  ;; Goal must hold at terminal stage stage6 to enforce exact progression
  (:goal (and
           (on blue yellow)
           (on yellow red)
           (current stage6)
         ))
)