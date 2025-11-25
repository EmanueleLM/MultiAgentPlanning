(define (problem orchestrator-blocks-prob)
  (:domain orchestrator-blocks)
  (:objects
    a1 - agent
    orange red yellow blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    ; single agent's hand is empty
    (hand-empty a1)

    ; initial stacked arrangement
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (on-table orange)

    ; only the top block is clear initially
    (clear red)

    ; stage progression: provide a chain of successors sufficient for the plan
    (stage-now s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)

    ; explicit distinct facts for all ordered distinct block pairs
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