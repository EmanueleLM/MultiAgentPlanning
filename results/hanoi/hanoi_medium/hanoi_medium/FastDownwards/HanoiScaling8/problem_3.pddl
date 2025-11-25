(define (problem hanoi-5)
  (:domain hanoi)

  (:objects
    a b c d e - disk
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 step32 - step
  )

  (:init
    ;; disk locations: initially all disks on middle peg (a top ... e bottom)
    (on a middle)
    (on b middle)
    (on c middle)
    (on d middle)
    (on e middle)

    ;; immediate stacking (a above b, b above c, c above d, d above e)
    (above a b)
    (above b c)
    (above c d)
    (above d e)

    ;; top and bottom for middle peg
    (top middle a)
    (bottom middle e)

    ;; left and right pegs start empty
    (empty left)
    (empty right)

    ;; size ordering: larger X Y means X is larger than Y
    ;; b > a
    (larger b a)
    ;; c > a,b
    (larger c a) (larger c b)
    ;; d > a,b,c
    (larger d a) (larger d b) (larger d c)
    ;; e > a,b,c,d
    (larger e a) (larger e b) (larger e c) (larger e d)

    ;; step ordering: 31 moves available, step1 initial, step32 terminal
    (next step1 step2) (next step2 step3) (next step3 step4) (next step4 step5) (next step5 step6)
    (next step6 step7) (next step7 step8) (next step8 step9) (next step9 step10) (next step10 step11)
    (next step11 step12) (next step12 step13) (next step13 step14) (next step14 step15) (next step15 step16)
    (next step16 step17) (next step17 step18) (next step18 step19) (next step19 step20) (next step20 step21)
    (next step21 step22) (next step22 step23) (next step23 step24) (next step24 step25) (next step25 step26)
    (next step26 step27) (next step27 step28) (next step28 step29) (next step29 step30) (next step30 step31)
    (next step31 step32)

    ;; start at step1
    (step-current step1)
  )

  (:goal (and
    ;; all disks on right peg in the correct stack order top->bottom: a,b,c,d,e
    (on a right)
    (on b right)
    (on c right)
    (on d right)
    (on e right)
    ;; explicit ordering on the right peg: a above b, b above c, c above d, d above e
    (above a b)
    (above b c)
    (above c d)
    (above d e)
    (top right a)
    (bottom right e)
    ;; left and middle pegs must be empty when finished
    (empty left)
    (empty middle)
    ;; terminal step reached
    (step-current step32)
  ))