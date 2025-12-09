(define (problem hanoi-5)
  (:domain hanoi-mover)

  (:objects
    a b c d e - disk          ; a smallest ... e largest
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 end - step
  )

  (:init
    ;; initial stack on right from bottom e up to top a:
    (on-peg e right)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; left and middle pegs are empty initially
    (clear-peg left)
    (clear-peg middle)
    ;; top disk a is clear
    (clear-disk a)

    ;; size ordering (smaller)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; explicit step ordering and initial ready state (contiguous successor chain)
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
      ;; all disks stacked on middle peg (e bottom, then d ... a top)
      (on-peg e middle)
      (on-disk d e)
      (on-disk c d)
      (on-disk b c)
      (on-disk a b)
      ;; left and right pegs must be empty at the end
      (clear-peg left)
      (clear-peg right)
    )
  )
)