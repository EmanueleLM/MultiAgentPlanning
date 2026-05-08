(define (problem hanoi-5)
  (:domain hanoi-mover)

  (:objects
    d1 d2 d3 d4 d5 - disk
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 end - step
  )

  (:init
    ;; initial stack on right from bottom d5 up to top d1:
    (on-peg d5 right)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; left and middle pegs are empty initially
    (clear-peg left)
    (clear-peg middle)
    ;; top disk is clear
    (clear-disk d1)

    ;; size ordering (smaller)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

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
      ;; all disks stacked on middle peg (d5 bottom, then d4 ... d1 top)
      (on-peg d5 middle)
      (on-disk d4 d5)
      (on-disk d3 d4)
      (on-disk d2 d3)
      (on-disk d1 d2)
      ;; left and right pegs must be empty at the end
      (clear-peg left)
      (clear-peg right)
    )
  )
)