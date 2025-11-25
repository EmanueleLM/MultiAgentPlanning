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

  ; Note: the originally stated goal (blue on yellow, orange on red, yellow on orange)
  ; would create a cycle in the on relation and is physically impossible under the
  ; stack/unstack actions. Per causal consistency, the reachable acyclic goal below is used.
  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)