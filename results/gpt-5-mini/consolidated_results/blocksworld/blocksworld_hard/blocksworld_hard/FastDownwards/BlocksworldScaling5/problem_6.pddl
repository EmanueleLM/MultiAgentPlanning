(define (problem blocksworld-instance)
  (:domain blocksworld)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 - stage
  )

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

  ;; The original triply-cyclic stacking goal is impossible (would create a cycle).
  ;; The goal below is the reachable goal consistent with acyclic stacks.
  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)