(define (problem hanoi-5)
  (:domain hanoi)

  (:objects
    a b c d e - disk
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 step32 - step
    mover auditor - agent
  )

  (:init
    ; initial stack: all disks on middle (e = largest at bottom, a = smallest at top)
    (on a middle)
    (on b middle)
    (on c middle)
    (on d middle)
    (on e middle)

    ; define step order (contiguity)
    (next step1 step2) (next step2 step3) (next step3 step4) (next step4 step5) (next step5 step6)
    (next step6 step7) (next step7 step8) (next step8 step9) (next step9 step10) (next step10 step11)
    (next step11 step12) (next step12 step13) (next step13 step14) (next step14 step15) (next step15 step16)
    (next step16 step17) (next step17 step18) (next step18 step19) (next step19 step20) (next step20 step21)
    (next step21 step22) (next step22 step23) (next step23 step24) (next step24 step25) (next step25 step26)
    (next step26 step27) (next step27 step28) (next step28 step29) (next step29 step30) (next step30 step31)
    (next step31 step32)

    ; expected moves per the provided mover sequence (31 minimal moves for 5 disks)
    (expected step1 a middle right)
    (expected step2 b middle left)
    (expected step3 a right left)
    (expected step4 c middle right)
    (expected step5 a left middle)
    (expected step6 b left right)
    (expected step7 a middle right)
    (expected step8 d middle left)
    (expected step9 a right left)
    (expected step10 b right middle)
    (expected step11 a left middle)
    (expected step12 c right left)
    (expected step13 a middle right)
    (expected step14 b middle left)
    (expected step15 a right left)
    (expected step16 e middle right)
    (expected step17 a left middle)
    (expected step18 b left right)
    (expected step19 a middle right)
    (expected step20 c left middle)
    (expected step21 a right left)
    (expected step22 b right middle)
    (expected step23 a left middle)
    (expected step24 d left right)
    (expected step25 a middle right)
    (expected step26 b middle left)
    (expected step27 a right left)
    (expected step28 c middle right)
    (expected step29 a left middle)
    (expected step30 b left right)
    (expected step31 a middle right)

    ; initial current step (must start at step1)
    (step-current step1)

    ; agents present
    (agent mover)
    (agent auditor)
  )

  (:goal (and
           ; final configuration: all disks on right (a top .. e bottom)
           (on a right)
           (on b right)
           (on c right)
           (on d right)
           (on e right)

           ; every step must have been audited (auditor verified the entire sequence)
           (audited step1) (audited step2) (audited step3) (audited step4) (audited step5)
           (audited step6) (audited step7) (audited step8) (audited step9) (audited step10)
           (audited step11) (audited step12) (audited step13) (audited step14) (audited step15)
           (audited step16) (audited step17) (audited step18) (audited step19) (audited step20)
           (audited step21) (audited step22) (audited step23) (audited step24) (audited step25)
           (audited step26) (audited step27) (audited step28) (audited step29) (audited step30)
           (audited step31)

           ; the step cursor has advanced past the last move (ensures audit of last step occurred)
           (step-current step32)
         )
  )
)