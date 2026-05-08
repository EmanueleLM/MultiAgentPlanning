(define (problem hanoi4-instance)
  (:domain hanoi-4)

  (:objects
    a b c d - disk
    left middle right - peg
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 - step
  )

  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d left)

    (clear a)
    (clear middle)
    (clear right)

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

    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d middle)
    (clear left)
    (clear right)
    (at-step step15)
  ))
)