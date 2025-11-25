(define (problem hanoi4-instance)
  (:domain hanoi-4)

  (:objects
    A B C D - disk
    left middle right - peg
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 - step
  )

  (:init
    ;; initial stacking on left: A on B, B on C, C on D, D on left
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; only the top disk A is clear; the two empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; discrete stage progression: start at step0 and successors up to step15
    (at-step step0)
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)
    (next step8 step9)
    (next step9 step10)
    (next step10 step11)
    (next step11 step12)
    (next step12 step13)
    (next step13 step14)
    (next step14 step15)

    ;; static size ordering: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; final stack on middle: A on B, B on C, C on D, D on middle
    (on A B)
    (on B C)
    (on C D)
    (on D middle)
    ;; left and right pegs must be empty (no disk on them)
    (clear left)
    (clear right)
    ;; require reaching the terminal stage exactly
    (at-step step15)
  ))
)