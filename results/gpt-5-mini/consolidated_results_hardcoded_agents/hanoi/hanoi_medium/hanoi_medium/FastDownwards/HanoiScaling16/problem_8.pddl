(define (problem hanoi5-instance)
  (:domain hanoi5)
  (:objects
    a b c d e - disk
    l m r - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 step32 - step
  )

  (:init
    ;; initial stack on middle peg m from top to bottom: a on b on c on d on e on m
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e m)

    ;; top and empty facts
    (top m a)
    (empty l)
    (empty r)

    ;; size relations
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; step control: start at step1
    (cur step1)

    ;; successor links (contiguous ordered steps)
    (succ step1 step2)   (succ step2 step3)   (succ step3 step4)   (succ step4 step5)
    (succ step5 step6)   (succ step6 step7)   (succ step7 step8)   (succ step8 step9)
    (succ step9 step10)  (succ step10 step11) (succ step11 step12) (succ step12 step13)
    (succ step13 step14) (succ step14 step15) (succ step15 step16) (succ step16 step17)
    (succ step17 step18) (succ step18 step19) (succ step19 step20) (succ step20 step21)
    (succ step21 step22) (succ step22 step23) (succ step23 step24) (succ step24 step25)
    (succ step25 step26) (succ step26 step27) (succ step27 step28) (succ step28 step29)
    (succ step29 step30) (succ step30 step31) (succ step31 step32)
  )

  (:goal
    (and
      ;; final stack on right peg r from top to bottom: a on b on c on d on e on r
      (on-disk a b)
      (on-disk b c)
      (on-disk c d)
      (on-disk d e)
      (on-peg e r)

      ;; left and middle pegs empty
      (empty l)
      (empty m)

      ;; must be at final step
      (cur step32)
    )
  )
)