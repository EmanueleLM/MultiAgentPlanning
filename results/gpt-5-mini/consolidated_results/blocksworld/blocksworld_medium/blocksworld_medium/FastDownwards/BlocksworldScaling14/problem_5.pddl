(define (problem blocks-problem1-sequential)
  (:domain blocks-multiagent-sequential)

  (:objects
    observer planner auditor orchestrator - agent
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ;; linear stage ordering (one step per action)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)

    ;; start at stage s0
    (current-stage s0)

    ;; single active manipulator: orchestrator's hand is free
    (handfree orchestrator)

    ;; initial block placement (as given)
    (on blue orange)
    (on-table red)
    (on-table orange)
    (on-table yellow)

    ;; explicit clear facts (as stated)
    (clear red)
    (clear blue)
    (clear yellow)
    ;; orange is not clear because blue is on orange -> do NOT assert (clear orange)
  )

  ;; Goal: exact tower red on blue, blue on yellow, yellow on orange
  (:goal (and
    (on red blue)
    (on blue yellow)
    (on yellow orange)
  ))
)