(define (problem hanoi4)
  (:domain hanoi)

  (:objects
    a b c d - disk
    left middle right - peg
    ;; 16 step objects: s1 initial, s16 terminal after 15 moves
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; initial stack on middle peg (top -> bottom): a on b, b on c, c on d, d on middle
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; topmost disk a is clear; other disks are not declared clear (implicitly not clear)
    (clear-disk a)

    ;; left and right pegs are empty; middle peg is not empty (no clear-peg middle)
    (clear-peg left)
    (clear-peg right)

    ;; size ordering: a < b < c < d (all pairwise smaller relations used for checks)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)

    ;; step sequencing (contiguous stages). s1 is initial, s16 terminal after 15 moves.
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
  )

  (:goal
    (and
      ;; final stack on right peg (top -> bottom): a on b, b on c, c on d, d on right
      (on-disk a b)
      (on-disk b c)
      (on-disk c d)
      (on-peg d right)

      ;; final pegs left and middle must be empty
      (clear-peg left)
      (clear-peg middle)

      ;; top disk a must be clear
      (clear-disk a)

      ;; require reaching terminal step after exactly 15 moves
      (current s16)
    )
  )
)