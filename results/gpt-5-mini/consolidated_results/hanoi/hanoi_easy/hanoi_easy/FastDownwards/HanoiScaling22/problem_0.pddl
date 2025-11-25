(define (problem hanoi-4-middle-to-left)
  (:domain hanoi)
  (:objects
    disk1 disk2 disk3 disk4 - disk
    peg-left peg-middle peg-right - peg
  )

  (:init
    ;; Initial stack: all 4 disks on the middle peg, disk4 bottom, disk1 top
    (on disk4 peg-middle)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; Clear facts initially: only the topmost disk and empty pegs (except middle) are clear
    (clear disk1)
    (clear peg-left)
    (clear peg-right)

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
    ;; Final required stack: all disks stacked on the left peg (disk4 bottom on peg-left)
    (on disk4 peg-left)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; Middle and right pegs must be empty (no disk directly on them)
    (clear peg-middle)
    (clear peg-right)
  ))
)