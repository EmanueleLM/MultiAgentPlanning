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

    ;; size ordering: A < B < C < D (all necessary pairwise relations)
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

    ;; assign each step to the exact move (15 moves) following the optimal Hanoi sequence
    ;; Phase 1: move 3 disks from middle -> left using right as auxiliary (7 moves)
    ;; 1. Move A from middle -> left
    (assign s1 A middle left)
    ;; 2. Move B from middle -> right
    (assign s2 B middle right)
    ;; 3. Move A from left -> right
    (assign s3 A left right)
    ;; 4. Move C from middle -> left
    (assign s4 C middle left)
    ;; 5. Move A from right -> middle
    (assign s5 A right middle)
    ;; 6. Move B from right -> left
    (assign s6 B right left)
    ;; 7. Move A from middle -> left
    (assign s7 A middle left)

    ;; Phase 2: move D from middle -> right
    ;; 8. Move D from middle -> right
    (assign s8 D middle right)

    ;; Phase 3: move 3 disks from left -> right using middle as auxiliary (7 moves)
    ;; 9. Move A from left -> right
    (assign s9 A left right)
    ;;10. Move B from left -> middle
    (assign s10 B left middle)
    ;;11. Move A from right -> middle
    (assign s11 A right middle)
    ;;12. Move C from left -> right
    (assign s12 C left right)
    ;;13. Move A from middle -> left
    (assign s13 A middle left)
    ;;14. Move B from middle -> right
    (assign s14 B middle right)
    ;;15. Move A from left -> right
    (assign s15 A left right)
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