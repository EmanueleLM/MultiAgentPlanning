(define (problem blocks-problem)
  (:domain blocks)
  (:objects
    blue yellow orange red - block
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; Block configuration:
    (on orange red)
    (on yellow orange)
    (ontable red)
    (ontable blue)

    ;; Clearness / hand:
    (clear blue)
    (clear yellow)
    (handempty)

    ;; Stage progression (explicit linear stages). Exactly one stage-active token initially.
    (stage-active s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )

  (:goal (and
    (on blue orange)
    (on yellow red)
  ))
)