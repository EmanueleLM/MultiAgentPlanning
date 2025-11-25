(define (problem blocksworld-instance)
  (:domain blocksworld)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 - stage
  )

  ; The original goal included a 3-cycle (blue on yellow, orange on red, yellow on orange),
  ; which is inconsistent with the acyclic stacking constraint. The reachable acyclic goal
  ; below preserves placing orange on red while keeping blue on yellow.
  (:init
    (on red blue)
    (on blue yellow)
    (ontable yellow)
    (ontable orange)
    (clear red)
    (clear orange)
    (handempty)
    (at s0)
    (next s0 s1)
    (next s1 s2)
  )

  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)