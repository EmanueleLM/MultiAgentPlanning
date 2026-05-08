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
    (on a middle)
    (on b middle)
    (on c middle)
    (on d middle)
    (on e middle)

    (above a b)
    (above b c)
    (above c d)
    (above d e)

    (top middle a)
    (bottom middle e)

    (empty left)
    (empty right)

    (larger b a)
    (larger c a) (larger c b)
    (larger d a) (larger d b) (larger d c)
    (larger e a) (larger e b) (larger e c) (larger e d)

    (next step1 step2) (next step2 step3) (next step3 step4) (next step4 step5) (next step5 step6)
    (next step6 step7) (next step7 step8) (next step8 step9) (next step9 step10) (next step10 step11)
    (next step11 step12) (next step12 step13) (next step13 step14) (next step14 step15) (next step15 step16)
    (next step16 step17) (next step17 step18) (next step18 step19) (next step19 step20) (next step20 step21)
    (next step21 step22) (next step22 step23) (next step23 step24) (next step24 step25) (next step25 step26)
    (next step26 step27) (next step27 step28) (next step28 step29) (next step29 step30) (next step30 step31)
    (next step31 step32)

    (step-current step1)
  )

  (:goal (and
    (on a right)
    (on b right)
    (on c right)
    (on d right)
    (on e right)

    (above a b)
    (above b c)
    (above c d)
    (above d e)

    (top right a)
    (bottom right e)

    (empty left)
    (empty middle)

    (step-current step32)
  ))