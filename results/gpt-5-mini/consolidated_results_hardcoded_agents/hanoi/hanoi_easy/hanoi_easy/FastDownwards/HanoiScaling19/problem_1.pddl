(define (problem hanoi-4-problem)
  (:domain tower-of-hanoi-4)

  (:objects
    d1 d2 d3 d4 - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; explicit step ordering and start stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (current s0)

    ;; initial tower on the right peg (from bottom to top: d4, d3, d2, d1)
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; clear flags: only the topmost disk is clear; empty pegs are clear
    (clear-disk d1)
    (clear-peg left)
    (clear-peg middle)
    ;; right peg has disks, so not declared clear

    ;; static size ordering (smaller -> larger)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )

  ;; Goal: entire tower moved to the left peg in same order, middle and right pegs empty,
  ;; and the plan has progressed through all stages to s15.
  (:goal (and
    ;; tower on left peg
    (on-peg d4 left)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; middle and right pegs empty (clear)
    (clear-peg middle)
    (clear-peg right)

    ;; final stage reached
    (current s15)
  ))
)