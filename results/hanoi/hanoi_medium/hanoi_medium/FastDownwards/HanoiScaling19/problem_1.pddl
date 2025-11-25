(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; Size ordering: A < B < C < D < E (transitive pairs given explicitly)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; Initial immediate-support chain on the right peg: top-to-bottom A,B,C,D,E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; clear facts: topmost objects / empty pegs
    (clear A)
    (clear left)
    (clear middle)
    ;; Note: B, C, D, E, right are not clear initially (B has A on it, etc.)

    ;; Time/stage ordering chain (minimum 31 moves for 5 disks)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    ;; start at step s0
    (current s0)
  )

  (:goal (and
    ;; final chain on the left peg: A on B, B on C, C on D, D on E, E on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; both other pegs must be empty (no disk immediately on them)
    (clear middle)
    (clear right)
  ))