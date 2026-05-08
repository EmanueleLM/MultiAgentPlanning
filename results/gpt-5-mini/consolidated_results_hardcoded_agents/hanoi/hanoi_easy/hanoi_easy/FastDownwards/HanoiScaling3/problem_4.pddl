(define (problem hanoi-4-3)
  (:domain hanoi)

  (:objects
    ;; disks: d1 smallest ... d4 largest
    d1 d2 d3 d4 - disk

    ;; pegs: left p1, middle p2, right p3
    p1 p2 p3 - peg

    ;; explicit stages for sequential execution: allow exactly 15 moves (s0..s15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; stage chain and starting stage
    (current s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; initial stacking on left peg p1: top-to-bottom d1 on d2 on d3 on d4 on p1
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-peg  d4 p1)

    ;; top indicators: only the top disk and empty pegs are clear
    (clear-disk d1)
    (clear-peg p2)
    (clear-peg p3)

    ;; size ordering (static)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal (and
    ;; final stacking on right peg p3: d1 on d2 on d3 on d4 on p3
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-peg  d4 p3)

    ;; left and middle pegs must be empty
    (clear-peg p1)
    (clear-peg p2)

    ;; final stage reached (requires exactly 15 moves)
    (current s15)
  ))
)