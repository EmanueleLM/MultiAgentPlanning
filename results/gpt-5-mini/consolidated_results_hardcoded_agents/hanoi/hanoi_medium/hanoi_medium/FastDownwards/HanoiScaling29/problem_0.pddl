(define (problem hanoi-instance-3)
  (:domain hanoi)
  (:objects
    disk1 disk2 disk3 - disk
    peg-left peg-middle peg-right - peg
  )
  (:init
    ;; initial stack on the left peg: disk3 (largest) bottom, disk2 middle, disk1 top
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 peg-left)

    ;; clear facts: only the top disk and the empty pegs are clear
    (clear disk1)
    (clear peg-middle)
    (clear peg-right)

    ;; size (smaller) relations: disk1 < disk2 < disk3
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk2 disk3)
  )

  ;; Goal: full tower assembled on the right peg, and the middle peg must be empty (clear)
  (:goal (and
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 peg-right)
    (clear peg-middle)
  ))
)