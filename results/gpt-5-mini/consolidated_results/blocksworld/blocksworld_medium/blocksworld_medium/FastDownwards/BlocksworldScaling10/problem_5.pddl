(define (problem blocksworld-scaling10-problem)
  (:domain blocksworld-scaling10-domain)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; initial stacking
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)

    ;; explicit clear facts as given (only red is declared clear initially)
    (clear red)

    ;; hand initially empty
    (handempty)

    ;; stage progression: at-stage and successor relation
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )

  ;; Goal: yellow on top of red
  (:goal (and (on yellow red)))
)