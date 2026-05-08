(define (problem move-yellow-on-orange)
  (:domain orchestrator-blocks)
  (:objects
    orange yellow blue red - block
    s0 s1 s2 s3 - stage
  )
  (:init
    ;; tower structure: red <- blue <- orange
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)

    ;; clarity and hand
    (clear orange)
    (clear yellow)
    (handempty)

    ;; stage progression: start at s0, chain s0->s1->s2->s3
    (atstage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
  ))
)