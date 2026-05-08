(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    left middle right - peg
    d1 d2 d3 d4 - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; initial direct placements: all disks stacked on the MIDDLE peg
    (on d4 middle)   ;; largest disk directly on middle peg
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)       ;; smallest disk at top

    ;; initial clear markers (only top objects and empty pegs are clear)
    (clear d1)
    (clear left)
    (clear right)

    ;; size order (strict): d1 < d2 < d3 < d4 (and transitive relations enumerated)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; explicit step chain: enforce ordering of exactly 15 moves
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; initial current step is s0; executing a move consumes the current-step to the successor
    (current-step s0)
  )

  (:goal
    (and
      ;; terminal condition: all four disks must be stacked on RIGHT in correct order
      (on d4 right)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
      (clear d1)

      ;; left peg must be empty at the end (explicitly required)
      (clear left)

      ;; enforce that exactly 15 moves were performed by requiring the final step
      (current-step s15)
    )
  )
)