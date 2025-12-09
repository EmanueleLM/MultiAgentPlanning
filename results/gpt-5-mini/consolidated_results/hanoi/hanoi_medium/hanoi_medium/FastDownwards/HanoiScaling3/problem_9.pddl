(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E left middle right - place
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )
  (:init
    ;; classify disks and pegs
    (is-disk A) (is-disk B) (is-disk C) (is-disk D) (is-disk E)
    (is-peg left) (is-peg middle) (is-peg right)

    ;; initial tower on left: from top A down to E on peg left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; initially only the top disk and the empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering between disks (smaller means allowed to be placed on the second argument)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; every disk can be placed on any empty peg (peg treated as larger than any disk)
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)

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
    ;; entire tower transferred to right with identical ordering (top A ... bottom E)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; require left and middle pegs to be empty (no disk directly on them)
    (clear left)
    (clear middle)

    ;; require the final step used (enforces contiguous execution of the step chain)
    (used s31)
  ))