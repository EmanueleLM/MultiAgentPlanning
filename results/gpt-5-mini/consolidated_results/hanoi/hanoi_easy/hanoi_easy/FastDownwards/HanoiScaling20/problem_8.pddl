(define (problem hanoi4_serial-problem)
  (:domain hanoi4_serial)
  (:objects
    a b c d - disk
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 - step
  )

  (:init
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d right)

    (loc a right)
    (loc b right)
    (loc c right)
    (loc d right)

    (clear-disk a)
    (clear-peg left)
    (clear-peg middle)

    (current-step step1)
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
    (next step15 step16)

    (different left middle) (different left right)
    (different middle left) (different middle right)
    (different right left) (different right middle)
  )

  (:goal (and
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d middle)
    (loc a middle)
    (loc b middle)
    (loc c middle)
    (loc d middle)
    (clear-peg left)
    (clear-peg right)
    (current-step step16)
  ))
)