(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; Initial stack on left peg, top-to-bottom: A,B,C,D,E
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E left)

    ;; Only top disk A is clear; other disks have something on them
    (clear-disk A)

    ;; Middle and right pegs are empty; left peg is not clear (has E)
    (clear-peg middle)
    (clear-peg right)

    ;; Size ordering (larger X Y means X is larger than Y)
    (larger B A)
    (larger C A) (larger C B)
    (larger D A) (larger D B) (larger D C)
    (larger E A) (larger E B) (larger E C) (larger E D)

    ;; Stage ordering for exactly 31 moves (2^5 - 1 = 31)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)

    ;; initial current stage
    (current-stage s0)
  )

  (:goal (and
    ;; all disks stacked on right in same top-to-bottom order A,B,C,D,E
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E right)

    ;; left and middle pegs must be empty at the end
    (clear-peg left)
    (clear-peg middle)

    ;; require exact stage advancement to the final stage after 31 moves
    (current-stage s31)
  ))
)