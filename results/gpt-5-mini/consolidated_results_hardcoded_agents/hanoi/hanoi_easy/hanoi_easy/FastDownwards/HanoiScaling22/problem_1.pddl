(define (problem hanoi-4-middle-to-left)
  (:domain hanoi)
  (:objects
    disk1 disk2 disk3 disk4 - disk
    peg-left peg-middle peg-right - peg
    ;; explicit discrete stages: 0..15 (15 moves required for 4 disks)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 - step
  )

  (:init
    ;; Initial physical stacking (current state at step0):
    ;; bottom to top on middle peg: disk4 (bottom), disk3, disk2, disk1 (top)
    (on disk4 peg-middle)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; Clear facts initially: only topmost disk and empty pegs (except middle) are clear
    (clear disk1)
    (clear peg-left)
    (clear peg-right)

    ;; Current stage is step0
    (time step0)

    ;; Successor relation enforces ordered stages
    (succ step0 step1) (succ step1 step2) (succ step2 step3) (succ step3 step4)
    (succ step4 step5) (succ step5 step6) (succ step6 step7) (succ step7 step8)
    (succ step8 step9) (succ step9 step10) (succ step10 step11) (succ step11 step12)
    (succ step12 step13) (succ step13 step14) (succ step14 step15)

    ;; can-be-on: any disk may be placed on any peg
    (can-be-on disk1 peg-left) (can-be-on disk1 peg-middle) (can-be-on disk1 peg-right)
    (can-be-on disk2 peg-left) (can-be-on disk2 peg-middle) (can-be-on disk2 peg-right)
    (can-be-on disk3 peg-left) (can-be-on disk3 peg-middle) (can-be-on disk3 peg-right)
    (can-be-on disk4 peg-left) (can-be-on disk4 peg-middle) (can-be-on disk4 peg-right)

    ;; can-be-on for disk->disk only when destination disk is larger (enforces no larger-on-smaller)
    ;; disk1 (smallest) can be on disk2,disk3,disk4
    (can-be-on disk1 disk2) (can-be-on disk1 disk3) (can-be-on disk1 disk4)
    ;; disk2 can be on disk3,disk4
    (can-be-on disk2 disk3) (can-be-on disk2 disk4)
    ;; disk3 can be on disk4
    (can-be-on disk3 disk4)
  )

  (:goal (and
    ;; Final required stack at the final stage (step15): all disks stacked on the left peg
    (on disk4 peg-left)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; Middle and right pegs must be empty at the final stage
    (clear peg-middle)
    (clear peg-right)

    ;; Must reach final stage explicitly
    (time step15)
  ))
)