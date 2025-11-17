(define (problem three-agent-hanoi-3disk)
  (:domain multi-agent-hanoi)
  (:objects
    disk1 disk2 disk3 - disk
    pegA pegB pegC - peg
  )

  (:init
    ;; initial stacking: disk3 (largest) on pegA, disk2 on disk3, disk1 on disk2
    (on-peg disk3 pegA)
    (on-disk disk2 disk3)
    (on-disk disk1 disk2)

    ;; clear/top facts
    (clear-disk disk1)    ;; top-most disk is clear
    ;; disk2 and disk3 are not clear (facts omitted)
    (clear-peg pegB)
    (clear-peg pegC)
    ;; pegA is not clear (fact omitted)

    ;; size relations (smaller)
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk2 disk3)

    ;; agent assignments (each agent controls a specific disk)
    (assigned1 disk1)
    (assigned2 disk2)
    (assigned3 disk3)
  )

  (:goal
    (and
      ;; all disks moved to pegC in correct order: disk3 on pegC, disk2 on disk3, disk1 on disk2
      (on-peg disk3 pegC)
      (on-disk disk2 disk3)
      (on-disk disk1 disk2)
    )
  )
)