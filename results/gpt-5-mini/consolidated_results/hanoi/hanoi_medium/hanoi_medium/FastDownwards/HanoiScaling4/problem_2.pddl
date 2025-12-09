(define (problem hanoi-5-AtoMiddle)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10
    s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 - step
  )

  (:init
    ;; size ordering: A smallest, E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; initial stack on left: top A on B on C on D on E on left
    (on-disk A B) (on-disk B C) (on-disk C D) (on-disk D E) (on-peg E left)
    (top left A)
    (empty middle)
    (empty right)

    ;; schedule the validated move sequence (31 moves). Each scheduled step is an explicit hard constraint.
    (scheduled s1 A left middle)
    (scheduled s2 B left right)
    (scheduled s3 A middle right)
    (scheduled s4 C left middle)
    (scheduled s5 A right left)
    (scheduled s6 B right middle)
    (scheduled s7 A left middle)
    (scheduled s8 D left right)
    (scheduled s9 A middle right)
    (scheduled s10 B middle left)
    (scheduled s11 A right left)
    (scheduled s12 C middle right)
    (scheduled s13 A left middle)
    (scheduled s14 B left right)
    (scheduled s15 A middle right)
    (scheduled s16 E left middle)
    (scheduled s17 A right left)
    (scheduled s18 B right middle)
    (scheduled s19 A left middle)
    (scheduled s20 C right left)
    (scheduled s21 A middle right)
    (scheduled s22 B middle left)
    (scheduled s23 A right left)
    (scheduled s24 D right middle)
    (scheduled s25 A left middle)
    (scheduled s26 B left right)
    (scheduled s27 A middle right)
    (scheduled s28 C left middle)
    (scheduled s29 A right left)
    (scheduled s30 B right middle)
    (scheduled s31 A left middle)

    ;; step ordering: s1 -> s2 -> ... -> s31 -> s32 (terminal successor)
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11)
    (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)
    (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21)
    (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26)
    (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31)
    (next s31 s32)

    ;; initial ready state: only first move is ready
    (ready s1)
  )

  (:goal (and
    ;; final configuration: middle peg holds A (top), B, C, D, E (bottom)
    (on-disk A B) (on-disk B C) (on-disk C D) (on-disk D E) (on-peg E middle)
    (top middle A)
    ;; left and right pegs empty as required
    (empty left)
    (empty right)
  ))