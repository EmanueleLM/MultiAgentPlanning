(define (problem make-tower)
  (:domain stacking-multiagent)
  (:objects
    red yellow blue orange - block
    orchestrator - agent
    ;; discrete ordered stages (s0 is initial, each action must move to successor)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 - stage
  )

  (:init
    ;; initial stacking as specified:
    (on blue yellow)
    (on orange blue)
    (on yellow red)
    (ontable red)

    ;; only orange is clear initially (as stated)
    (clear orange)

    ;; single-hand empty initially for the acting agent
    (handempty orchestrator)

    ;; stage ordering and initial stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14)
    (current s0)
  )

  (:goal
    (and
      ;; terminal spatial arrangement exactly as requested
      (on red yellow)
      (on orange red)
      (on blue orange)
    )
  )
)