(define (problem hanoi4)
  (:domain hanoi)

  (:objects
    A B C D - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; initial immediate supports (top -> bottom via immediate on relations)
    (on A B)
    (on B C)
    (on C D)
    (on D middle)

    ;; clear means "nothing on top of this object"
    (clear A)
    (clear left)
    (clear right)
    ;; B,C,D,middle are not listed as clear (they have things above) — absence encodes false

    ;; size ordering: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; step sequencing (contiguity) and initial current step
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (succ s11 s12)
    (succ s12 s13)
    (succ s13 s14)
    (succ s14 s15)
    (succ s15 s16)

    (current s1)

    ;; assign each step to the exact move the decomposer/simulator/auditor specified.
    ;; Note: the "to" argument is the immediate support after the move (either a peg or a disk),
    ;; ensuring we encode exactly what will be placed under the moved disk at that step.
    ;; 1. Move A from middle -> left     (left was empty)      => support: left (peg)
    (assign s1 A middle left)
    ;; 2. Move B from middle -> right    (right empty)         => support: right (peg)
    (assign s2 B middle right)
    ;; 3. Move A from left -> right      (right had B on top)  => support: B (disk)
    (assign s3 A left B)
    ;; 4. Move C from middle -> left     (left empty after 3)   => support: left (peg)
    (assign s4 C middle left)
    ;; 5. Move A from right -> middle    (middle top is D)      => support: D (disk)
    (assign s5 A right D)
    ;; 6. Move B from right -> left      (left top is C)        => support: C (disk)
    (assign s6 B right C)
    ;; 7. Move A from middle -> left     (left top is B)        => support: B (disk)
    (assign s7 A middle B)
    ;; 8. Move D from middle -> right    (right empty)          => support: right (peg)
    (assign s8 D middle right)
    ;; 9. Move A from left -> right      (right top is D)        => support: D (disk)
    (assign s9 A left D)
    ;;10. Move B from left -> middle     (middle empty)         => support: middle (peg)
    (assign s10 B left middle)
    ;;11. Move A from right -> middle    (middle top is B)      => support: B (disk)
    (assign s11 A right B)
    ;;12. Move C from left -> right      (right top is D)       => support: D (disk)
    (assign s12 C left D)
    ;;13. Move A from middle -> left     (left empty)           => support: left (peg)
    (assign s13 A middle left)
    ;;14. Move B from middle -> right    (right top is C)       => support: C (disk)
    (assign s14 B middle C)
    ;;15. Move A from left -> right      (right top is B)       => support: B (disk)
    (assign s15 A left B)
  )

  (:goal
    (and
      ;; final stack on right (top->bottom): A on B, B on C, C on D, D on right (peg)
      (on A B)
      (on B C)
      (on C D)
      (on D right)
      ;; final pegs left and middle must be empty (i.e., clear)
      (clear left)
      (clear middle)
      ;; top disk A must be clear (no disk above)
      (clear A)
    )
  )
)