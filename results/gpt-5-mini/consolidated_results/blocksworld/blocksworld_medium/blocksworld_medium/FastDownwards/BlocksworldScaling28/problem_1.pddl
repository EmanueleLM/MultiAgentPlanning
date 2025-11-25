(define (problem blocksworld-scaling28-problem)
  (:domain blocksworld-scaling28)

  (:objects
    ;; blocks
    red blue yellow orange - block

    ;; agents (roles are assigned in init)
    picker stacker auditor orchestrator - agent

    ;; explicit discrete stages/time steps
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ;; role assignments (label actions by agent)
    (is-picker picker)
    (is-stacker stacker)
    (is-auditor auditor)
    (is-orchestrator orchestrator)

    ;; initial hand state (single hand)
    (handempty)

    ;; initial spatial configuration (from specification)
    (on red orange)
    (ontable orange)
    (ontable blue)
    (ontable yellow)

    ;; clear predicates consistent with the above: a block is clear iff no block on top and not held
    (clear red)
    (clear blue)
    (clear yellow)
    ;; note: orange is not clear because red is on it

    ;; no block is being held initially (holding predicates absent by default)

    ;; explicit stage ordering and starting stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)

    (current-stage s0)
  )

  (:goal (and
    ;; target stacking configuration (as requested)
    (on blue red)
    (on orange yellow)
    (on yellow blue)
  ))
)