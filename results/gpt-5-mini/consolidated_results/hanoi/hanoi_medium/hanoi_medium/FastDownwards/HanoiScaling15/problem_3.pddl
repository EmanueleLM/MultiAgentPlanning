(define (problem hanoi-5)
  (:domain hanoi-mover)

  (:objects
    A B C D E - disk          ; A smallest ... E largest
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 end - step
  )

  (:init
    ;; initial stack on right from bottom E up to top A:
    (on-peg E right)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; left and middle pegs are empty initially
    (clear-peg left)
    (clear-peg middle)
    ;; top disk A is clear
    (clear-disk A)

    ;; size ordering (smaller)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; explicit step ordering and initial ready state
    (succ step1 step2) (succ step2 step3) (succ step3 step4) (succ step4 step5)
    (succ step5 step6) (succ step6 step7) (succ step7 step8) (succ step8 step9)
    (succ step9 step10) (succ step10 step11) (succ step11 step12) (succ step12 step13)
    (succ step13 step14) (succ step14 step15) (succ step15 step16) (succ step16 step17)
    (succ step17 step18) (succ step18 step19) (succ step19 step20) (succ step20 step21)
    (succ step21 step22) (succ step22 step23) (succ step23 step24) (succ step24 step25)
    (succ step25 step26) (succ step26 step27) (succ step27 step28) (succ step28 step29)
    (succ step29 step30) (succ step30 step31) (succ step31 end)

    (ready step1)
  )

  (:goal
    (and
      ;; all disks stacked on middle peg (E bottom, then D ... A top)
      (on-peg E middle)
      (on-disk D E)
      (on-disk C D)
      (on-disk B C)
      (on-disk A B)
      ;; left and right pegs must be empty at the end
      (clear-peg left)
      (clear-peg right)
    )
  )
)