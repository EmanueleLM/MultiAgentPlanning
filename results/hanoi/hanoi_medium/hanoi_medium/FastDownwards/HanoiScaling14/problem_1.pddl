(define (problem hanoi-five-instance)
  (:domain hanoi-five)

  (:objects
    A B C D E left middle right - object
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ; Mark disks and pegs
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (peg left) (peg middle) (peg right)

    ; Initial stacking on the middle peg (bottom to top: E, D, C, B, A)
    (on E middle)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; Clear facts: top disk A is clear; empty pegs left and right are clear
    (clear A)
    (clear left)
    (clear right)

    ; Size ordering facts: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ; allow-place: any disk may be placed on any peg
    (allow-place A left) (allow-place A middle) (allow-place A right)
    (allow-place B left) (allow-place B middle) (allow-place B right)
    (allow-place C left) (allow-place C middle) (allow-place C right)
    (allow-place D left) (allow-place D middle) (allow-place D right)
    (allow-place E left) (allow-place E middle) (allow-place E right)

    ; allow-place for disk->disk only when smaller relation holds
    (allow-place A B) (allow-place A C) (allow-place A D) (allow-place A E)
    (allow-place B C) (allow-place B D) (allow-place B E)
    (allow-place C D) (allow-place C E)
    (allow-place D E)

    ; Explicit successor chain for discrete time steps (enforces ordered stages)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    ; Start at step s0
    (current s0)
  )

  ; Goal: entire tower transferred from middle to left preserving order,
  ; right and middle pegs empty, and reach final step s31.
  (:goal (and
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    (clear middle)
    (clear right)
    (current s31)
  ))
)