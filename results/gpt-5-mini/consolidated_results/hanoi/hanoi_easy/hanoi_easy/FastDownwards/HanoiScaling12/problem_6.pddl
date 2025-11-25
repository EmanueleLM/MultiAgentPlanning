(define (problem hanoi4-problem)
  (:domain hanoi4)

  ; Assumptions encoded below:
  ; - Exactly 15 sequential moves are enforced by explicit stage objects s0..s15 and succ facts.
  ; - Disks ordered smallest->largest: A, B, C, D.
  ; - Initial right peg stack (top-to-bottom): A, B, C, D.
  ; - Goal: identical stack on left peg, middle and right pegs empty, and current stage is s15.

  (:objects
    A B C D - disk
    left middle right - peg
    ; stages s0..s15 to enforce 2^4 - 1 = 15 sequential moves
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial stack on right peg: from top to bottom A, B, C, D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    ;; other pegs initially empty
    (empty left)
    (empty middle)

    ;; size relations (strict ordering)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ;; explicit stage chain and initial current stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (current s0)

    ;; explicit distinctness facts for pegs (used to forbid no-op moves)
    (diff left middle) (diff left right)
    (diff middle left) (diff middle right)
    (diff right left) (diff right middle)
  )

  ;; Goal: left peg must hold full stack top-to-bottom A,B,C,D, middle and right empty,
  ;; and the plan must have advanced to stage s15 (exactly 15 moves).
  (:goal (and
    (top A left)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)

    (empty middle)
    (empty right)

    (current s15)
  ))
)