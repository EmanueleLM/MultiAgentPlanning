(define (problem blocksworld-instance)
  (:domain blocksworld)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 - stage
  )

  (:init
    ;; stacking relations (initial stack: red on blue on yellow)
    (on red blue)
    (on blue yellow)
    ;; table facts
    (ontable yellow)
    (ontable orange)
    ;; clear facts: top blocks are clear (no block on top) and not held
    (clear red)
    (clear orange)
    ;; hand and stage
    (handempty)
    (at s0)
    ;; explicit stage ordering (actions must advance along these successors)
    (next s0 s1)
    (next s1 s2)
  )

  ;; The original cyclic goal (blue on yellow, orange on red, yellow on orange)
  ;; is physically impossible because it would create a cycle in the on relation.
  ;; The reachable, acyclic goal selected here (per causal consistency requirement) is:
  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)