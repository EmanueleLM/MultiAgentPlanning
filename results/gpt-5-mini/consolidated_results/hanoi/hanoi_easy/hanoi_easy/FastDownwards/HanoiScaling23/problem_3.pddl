(define (problem hanoi-4disks-3pegs)
  (:domain hanoi-multiagent)

  (:objects
    mover - agent

    d1 d2 d3 d4 - disk

    left mid right - peg

    ;; discrete stages: s0 ... s15 (15 moves required for 4 disks -> stages 0..15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; agent
    (is-agent mover)

    ;; initial stack on left (bottom to top): d4 (bottom) <- d3 <- d2 <- d1 (top)
    (on-peg d4 left)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; only the top disk is clear
    (clear d1)

    ;; peg emptiness: middle and right are empty
    (empty mid)
    (empty right)

    ;; static size ordering (smallest d1, largest d4)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; stage chain and initial active stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    (at-stage s0)
  )

  (:goal (and
    ;; full stack on right in correct order (bottom to top: d4, d3, d2, d1)
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (clear d1)

    ;; left and middle must be empty
    (empty left)
    (empty mid)

    ;; terminal stage reached after exactly 15 moves
    (at-stage s15)
  ))