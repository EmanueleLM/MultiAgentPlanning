(define (problem blocks-stack-blue-yellow-red)
  (:domain blocks)
  (:objects
    blue yellow red orange - block
    h - hand
    stage0 stage1 stage2 stage3 stage4 - stage
  )
  (:init
    ;; initial stack positions
    (on blue red)
    (ontable red)
    (ontable orange)
    (ontable yellow)

    ;; clear status: blocks with nothing on top and not held
    (clear blue)
    (clear orange)
    (clear yellow)
    ;; note: red is not clear because blue is on red

    ;; hand status
    (handempty h)

    ;; discrete stage progression: start at stage0 and have successors for each step
    (current stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
  )
  ;; goals must hold at the terminal stage (stage4) to enforce contiguous progression
  (:goal (and
           (on blue yellow)
           (on yellow red)
           (current stage4)
         ))
)