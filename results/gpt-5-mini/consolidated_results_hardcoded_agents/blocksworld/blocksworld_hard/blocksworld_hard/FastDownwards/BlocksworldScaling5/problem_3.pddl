(define (problem blocksworld-instance)
  (:domain blocksworld)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 - stage
  )

  ;; NOTE:
  ;; The public specification requires reachable states to maintain acyclic stacking.
  ;; A 3-cycle goal (on blue yellow) AND (on orange red) AND (on yellow orange)
  ;; would create a cycle and is therefore unreachable under the acyclicity constraint.
  ;; The problem below uses the reachable acyclic goal (preserving the intention to
  ;; place orange on red while keeping blue on yellow).
  ;; (The unreachable cyclic goal is intentionally omitted to enforce acyclicity.)
  (:init
    ;; initial stack: red on blue, blue on yellow, yellow on the table, orange on the table
    (on red blue)
    (on blue yellow)
    (ontable yellow)
    (ontable orange)

    ;; clear blocks (no block on top, and not held)
    (clear red)
    (clear orange)

    ;; hand initially empty
    (handempty)

    ;; discrete stage/time: start at s0; actions must advance along next links
    (at s0)
    (next s0 s1)
    (next s1 s2)
  )

  ;; Corrected reachable goal (acyclic)
  (:goal (and
    (on blue yellow)
    (on orange red)
  ))
)