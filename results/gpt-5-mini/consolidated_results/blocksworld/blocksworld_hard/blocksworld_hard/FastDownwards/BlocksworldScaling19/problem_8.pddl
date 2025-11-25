; Assumption: steps s0..s10 form a contiguous one-action-per-step timeline; initial current is s0.
(define (problem BlocksworldScaling19)
  (:domain blocks)
  (:objects
    blue yellow orange red - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )
  (:init
    ;; step successor chain and initial current step (enforces one action per step)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (current s0)

    ;; Explicit distinctness facts for all ordered pairs of different blocks
    (different blue yellow) (different yellow blue)
    (different blue orange) (different orange blue)
    (different blue red) (different red blue)
    (different yellow orange) (different orange yellow)
    (different yellow red) (different red yellow)
    (different orange red) (different red orange)

    ;; blocks initial configuration (matches the human specification)
    (clear blue)
    (clear yellow)
    (handempty)
    (on blue orange)
    (on orange red)
    (on-table red)
    (on-table yellow)
  )
  (:goal (and
    (on red blue)
    (on orange red)
    (on yellow orange)
  ))
)