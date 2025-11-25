(define (problem hanoi4-problem)
  (:domain hanoi4)

  ; Assumptions and hard enforcement:
  ; - Exactly 15 sequential moves are required (2^4 - 1), enforced by stage objects s0..s15 and succ facts.
  ; - The plan must advance current stage from s0 to s15; no other mechanism can satisfy the goal stage.
  ; - Disks are ordered smallest->largest: a, b, c, d. Size ordering is static via (smaller ...) facts.
  ; - Initial right peg stack (top-to-bottom): a, b, c, d. left and middle pegs are initially empty.
  ; - Goal: left peg must hold stack top-to-bottom a,b,c,d; middle and right pegs must be empty; current stage must be s15.
  ; - No no-op moves are allowed; explicit (diff ...) facts forbid moves where source == destination.

  (:objects
    a b c d - disk
    left middle right - peg
    ; stages s0..s15 to enforce 15 strictly sequential moves
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial stack on right peg: from top to bottom a, b, c, d
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d right)
    (top a right)

    ;; other pegs initially empty
    (empty left)
    (empty middle)

    ;; size relations (strict ordering)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

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

  (:goal (and
    ;; left peg must contain the full stack top-to-bottom a,b,c,d
    (top a left)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d left)

    ;; middle and right pegs must be empty
    (empty middle)
    (empty right)

    ;; plan must have advanced exactly to stage s15
    (current s15)
  ))
)