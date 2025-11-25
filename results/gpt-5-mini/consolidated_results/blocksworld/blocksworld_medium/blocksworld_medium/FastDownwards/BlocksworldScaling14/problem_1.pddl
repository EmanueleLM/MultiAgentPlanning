(define (problem blocks-problem1-sequential)
  (:domain blocks-multiagent-sequential)

  (:objects
    orchestrator - agent
    red blue yellow orange - block
    table1 - table
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; linear stage ordering (must be respected by every action)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)

    ;; start at stage s0
    (current-stage s0)

    ;; single-hand initially free
    (handfree orchestrator)

    ;; initial block placement (explicit)
    (on blue orange)
    (on red table1)
    (on orange table1)
    (on yellow table1)

    ;; clear facts: a block is clear iff nothing is on it (explicitly stated)
    (clear red)
    (clear blue)
    (clear yellow)
    ;; orange is not clear initially because blue is on orange -> do not assert (clear orange)
  )

  ;; Goal: exact tower red on blue, blue on yellow, yellow on orange
  (:goal (and
    (on red blue)
    (on blue yellow)
    (on yellow orange)
  ))
)