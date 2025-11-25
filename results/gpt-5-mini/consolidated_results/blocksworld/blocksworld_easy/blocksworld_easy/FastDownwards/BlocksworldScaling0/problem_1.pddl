(define (problem move-yellow-on-orange)
  (:domain orchestrator-blocks)
  (:objects
    orange yellow blue red - block
    s0 s1 s2 - stage
  )
  (:init
    ;; spatial relations
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)

    ;; state predicates
    (clear orange)
    (clear yellow)
    (handempty)

    ;; stage progression
    (next s0 s1)
    (next s1 s2)
    (now s0)
  )
  (:goal (and
    (on blue red)
    (on yellow orange)
    ;; require that the plan has progressed to the terminal stage s2
    (now s2)
  ))
)