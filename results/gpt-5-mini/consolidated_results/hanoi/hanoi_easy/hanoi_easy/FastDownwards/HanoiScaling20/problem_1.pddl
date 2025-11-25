(define (problem hanoi4_serial-problem)
  (:domain hanoi4_serial)
  (:objects
    a b c d - disk
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 - step
  )

  (:init
    ;; size ordering: A < B < C < D
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; initial direct support chain on right peg: top->bottom a,b,c,d
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg  d right)

    ;; all disk locations are on right initially
    (loc a right)
    (loc b right)
    (loc c right)
    (loc d right)

    ;; top disk and empty pegs
    (clear-disk a)
    (clear-peg left)
    (clear-peg middle)
    ;; right peg is not declared clear (it has disks)

    ;; sequencing tokens
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
  )

  (:goal (and
    ;; desired final chain on middle peg: top->bottom a,b,c,d
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg  d middle)

    ;; location facts: all disks on middle
    (loc a middle)
    (loc b middle)
    (loc c middle)
    (loc d middle)

    ;; left and right pegs must be empty
    (clear-peg left)
    (clear-peg right)

    ;; ensure the full ordered sequence was executed
    (current-step step16)
  ))
)