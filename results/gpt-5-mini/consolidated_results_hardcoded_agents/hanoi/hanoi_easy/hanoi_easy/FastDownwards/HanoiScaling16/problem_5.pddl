(define (problem hanoi4)
  (:domain hanoi)

  (:objects
    A B C D - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; initial stack on middle: D on middle, C on D, B on C, A on B
    (on-peg D middle)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; clear predicates: topmost disk A and empty pegs left and right
    (clear-disk A)
    (clear-peg left)
    (clear-peg right)

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

    ;; assign each step to the exact move (15 moves) following the optimal Hanoi sequence
    ;; Phase 1: move 3 disks from middle -> left using right as auxiliary (7 moves)
    ;; s1: Move A from on top of B -> left (disk -> peg)
    (assign-d-p s1 A B left)
    ;; s2: Move B from on top of C -> right (disk -> peg)
    (assign-d-p s2 B C right)
    ;; s3: Move A from left -> on top of B (peg -> disk)
    (assign-p-d s3 A left B)
    ;; s4: Move C from on top of D -> left (disk -> peg)
    (assign-d-p s4 C D left)
    ;; s5: Move A from on top of B -> middle (disk -> peg)
    (assign-d-p s5 A B middle)
    ;; s6: Move B from right -> on top of C (peg -> disk)
    (assign-p-d s6 B right C)
    ;; s7: Move A from middle -> on top of B (peg -> disk)
    (assign-p-d s7 A middle B)

    ;; Phase 2: move D from middle -> right (peg -> peg)
    ;; s8:
    (assign-p-p s8 D middle right)

    ;; Phase 3: move 3 disks from left -> right using middle as auxiliary (7 moves)
    ;; s9: Move A from on top of B -> on top of D (disk -> disk)
    (assign-d-d s9 A B D)
    ;; s10: Move B from on top of C -> middle (disk -> peg)
    (assign-d-p s10 B C middle)
    ;; s11: Move A from on top of D -> on top of B (disk -> disk)
    (assign-d-d s11 A D B)
    ;; s12: Move C from left -> on top of D (peg -> disk)
    (assign-p-d s12 C left D)
    ;; s13: Move A from on top of B -> left (disk -> peg)
    (assign-d-p s13 A B left)
    ;; s14: Move B from middle -> on top of C (peg -> disk)
    (assign-p-d s14 B middle C)
    ;; s15: Move A from left -> on top of B (peg -> disk)
    (assign-p-d s15 A left B)
  )

  (:goal
    (and
      ;; final stack on right (top->bottom): A on B, B on C, C on D, D on right
      (on-disk A B)
      (on-disk B C)
      (on-disk C D)
      (on-peg D right)
      ;; final pegs left and middle must be empty
      (clear-peg left)
      (clear-peg middle)
      ;; top disk A must be clear
      (clear-disk A)
      ;; require that all scheduled steps have been advanced to the terminal step
      (current s16)
    )
  )
)