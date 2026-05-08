(define (problem hanoi-problem)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; contiguous stages chain s0 -> s15
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (at-stage s0)

    ;; initial stack on the middle peg (top to bottom): a on b, b on c, c on d, d on middle
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d middle)

    ;; top/clear facts initially
    (clear-disk a)
    (clear-peg left)
    (clear-peg right)

    ;; static size ordering: a < b < c < d (complete strict ordering)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; distinctness facts for pegs (all ordered pairs of distinct pegs)
    (distinct-peg left middle) (distinct-peg left right)
    (distinct-peg middle left) (distinct-peg middle right)
    (distinct-peg right left) (distinct-peg right middle)

    ;; distinctness facts for disks (all ordered pairs of distinct disks)
    (distinct-disk a b) (distinct-disk a c) (distinct-disk a d)
    (distinct-disk b a) (distinct-disk b c) (distinct-disk b d)
    (distinct-disk c a) (distinct-disk c b) (distinct-disk c d)
    (distinct-disk d a) (distinct-disk d b) (distinct-disk d c)

    ;; placeholders used in some action preconditions require these reflexive-style facts
    ;; (these are inert facts to satisfy the precondition atoms used as placeholders)
    (distinct-peg left left) (distinct-peg middle middle) (distinct-peg right right)
    (distinct-disk a a) (distinct-disk b b) (distinct-disk c c) (distinct-disk d d)
  )

  (:goal (and
    ;; final stacking on the right peg (top to bottom): a on b, b on c, c on d, d on right
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d right)

    ;; left and middle pegs must be empty
    (clear-peg left)
    (clear-peg middle)

    ;; require reaching the final discrete stage (forces exactly 15 moves)
    (at-stage s15)
  ))