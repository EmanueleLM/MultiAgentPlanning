(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 d5 b1 b2 b3 - place
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )
  (:init
    ;; mark disks and pegs
    (is-disk d1) (is-disk d2) (is-disk d3) (is-disk d4) (is-disk d5)
    (is-peg b1) (is-peg b2) (is-peg b3)

    ;; initial tower on b1: from top d1 down to d5 on peg b1
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 b1)

    ;; initial clears: only the top disk and empty pegs are clear
    (clear d1)
    (clear b2)
    (clear b3)

    ;; size ordering between disks (smaller means allowed to be placed on the second argument)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ;; every disk can be placed on any empty peg
    (smaller d1 b1) (smaller d1 b2) (smaller d1 b3)
    (smaller d2 b1) (smaller d2 b2) (smaller d2 b3)
    (smaller d3 b1) (smaller d3 b2) (smaller d3 b3)
    (smaller d4 b1) (smaller d4 b2) (smaller d4 b3)
    (smaller d5 b1) (smaller d5 b2) (smaller d5 b3)

    ;; step ordering: linear chain s1 -> s2 -> ... -> s31 (31 moves required for 5 disks)
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    ;; first step marker
    (first s1)
  )

  (:goal (and
    ;; entire tower transferred to b3 with identical ordering (top d1 ... bottom d5)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 b3)

    ;; require left and middle pegs (b1, b2) to be empty (no disk directly on them)
    (clear b1)
    (clear b2)

    ;; require the final step used (enforces contiguous execution of the step chain)
    (used s31)
  ))
)