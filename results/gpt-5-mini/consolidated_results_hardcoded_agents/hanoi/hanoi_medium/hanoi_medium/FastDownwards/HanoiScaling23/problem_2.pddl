(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; Stack on the left peg top-to-bottom: A,B,C,D,E
    ;; represent as A on B, B on C, C on D, D on E, E on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; top-of-stack and empty pegs as 'clear' predicates:
    ;; A is top of left, so A is clear; left peg is not clear (E is on it).
    (clear A)
    ;; middle and right pegs start empty:
    (clear middle)
    (clear right)

    ;; static size ordering: larger X Y means X is larger than Y
    (larger B A)
    (larger C A) (larger C B)
    (larger D A) (larger D B) (larger D C)
    (larger E A) (larger E B) (larger E C) (larger E D)

    ;; stage ordering and initial current stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)
    (current-stage s0)
  )

  (:goal (and
    ;; all disks stacked on right in the same top-to-bottom order A,B,C,D,E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; require left and middle pegs empty at end (clear means peg empty)
    (clear left)
    (clear middle)

    ;; require that the plan has advanced through exactly 31 moves to reach final stage
    (current-stage s31)
  ))