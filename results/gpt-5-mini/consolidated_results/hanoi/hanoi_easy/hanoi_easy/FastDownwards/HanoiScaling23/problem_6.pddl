(define (problem hanoi-4disks-3pegs)
  (:domain hanoi-multiagent)

  (:objects
    mover - agent
    d1 d2 d3 d4 - disk
    left mid right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ; agent
    (is-agent mover)

    ; initial stack on left: top d1, then d2, then d3, then bottom d4
    (on-peg d4 left)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (clear d1)

    ; other pegs empty
    (empty mid)
    (empty right)

    ; size ordering: d1 < d2 < d3 < d4 (d1 smallest)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)

    ; stage ordering
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)
    (at-stage s0)
  )

  (:goal (and
    ; all disks stacked on right in same order top-to-bottom d1,d2,d3,d4
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (clear d1)
    ; left and middle pegs empty
    (empty left)
    (empty mid)
    ; final stage reached exactly
    (at-stage s15)
  ))
)