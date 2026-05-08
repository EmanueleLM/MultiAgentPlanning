(define (problem blocks-problem-01-staged)
  (:domain blocks-single-handed-staged)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; initial block arrangement
    (on orange yellow)
    (ontable red)
    (ontable blue)
    (ontable yellow)

    ;; hand / clear facts
    (clear red)
    (clear blue)
    (clear orange)
    (handempty)

    ;; staging: start at s0 and provide a forward chain of stages to enforce ordered single-action progression
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  ;; Goals: required final stacking relations and hand empty as a mandatory terminal condition.
  (:goal (and
    (on blue yellow)
    (on orange red)
    (handempty)
  ))
)