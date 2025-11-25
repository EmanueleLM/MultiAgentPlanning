(define (problem hanoi4-problem)
  (:domain hanoi4)

  (:objects
    A B C D - disk
    left middle right - peg
    ;; stages 0..15 to force exactly 15 moves (2^4 - 1 = 15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; stack: A on B, B on C, C on D, D on right peg; A is top of right peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    ;; empty pegs
    (empty left)
    (empty middle)

    ;; size relations (pairwise)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ;; stage chain and current stage start
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (current s0)

    ;; distinctness facts for pegs (ordered pairs)
    (diff left middle) (diff left right)
    (diff middle left) (diff middle right)
    (diff right left) (diff right middle)
  )

  ;; Goal: left peg must hold full stack top-to-bottom A,B,C,D and middle/right empty.
  ;; Also require the plan to have advanced to stage s15 (exactly 15 moves).
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