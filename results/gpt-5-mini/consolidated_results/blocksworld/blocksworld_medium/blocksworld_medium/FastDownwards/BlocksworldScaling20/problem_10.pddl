(define (problem orchestrator-blocks-prob)
  (:domain orchestrator-blocks)
  (:objects
    a1 - agent
    orange red yellow blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ;; single agent hand empty
    (hand-empty a1)

    ;; initial tower: red on blue on yellow on orange on table
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (on-table orange)

    ;; top block has nothing on it and is not held
    (clear red)

    ;; initial current stage
    (stage-now s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)

    ;; explicit distinctness between blocks
    (distinct orange red) (distinct orange yellow) (distinct orange blue)
    (distinct red orange) (distinct red yellow) (distinct red blue)
    (distinct yellow orange) (distinct yellow red) (distinct yellow blue)
    (distinct blue orange) (distinct blue red) (distinct blue yellow)
  )

  (:goal (and
    (on orange red)
    (on yellow blue)
  ))
)