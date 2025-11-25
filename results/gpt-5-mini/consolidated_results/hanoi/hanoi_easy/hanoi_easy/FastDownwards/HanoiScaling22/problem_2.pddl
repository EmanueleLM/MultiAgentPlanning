(define (problem hanoi-4-middle-to-left)
  (:domain hanoi)
  (:objects
    disk1 disk2 disk3 disk4 - disk
    peg-left peg-middle peg-right - peg
  )

  (:init
    ;; initial stack on middle peg (bottom to top): disk4, disk3, disk2, disk1
    (on disk4 peg-middle)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; only the topmost disk and the two empty pegs are clear initially
    (clear disk1)
    (clear peg-left)
    (clear peg-right)

    ;; disk size ordering (static)
    (smaller disk1 disk2) (smaller disk1 disk3) (smaller disk1 disk4)
    (smaller disk2 disk3) (smaller disk2 disk4)
    (smaller disk3 disk4)
  )

  (:goal (and
    ;; all disks stacked on the left peg (bottom to top: disk4,disk3,disk2,disk1)
    (on disk4 peg-left)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; middle and right pegs empty
    (clear peg-middle)
    (clear peg-right)
  ))
)