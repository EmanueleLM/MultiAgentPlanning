(define (problem hanoi-4disks-3pegs)
  (:domain hanoi-multiagent)

  (:objects
    mover - agent
    d1 d2 d3 d4 - disk
    left mid right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    (is-agent mover)
    (on-peg d4 left)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (clear d1)
    (empty mid)
    (empty right)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)
    (at-stage s0)
  )

  (:goal (and
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (clear d1)
    (empty left)
    (empty mid)
    (at-stage s15)
  ))
)