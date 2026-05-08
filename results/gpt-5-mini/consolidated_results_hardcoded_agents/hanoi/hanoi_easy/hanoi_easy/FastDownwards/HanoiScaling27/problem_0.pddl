(define (problem hanoi-3-disks)
  (:domain hanoi-mover)
  (:objects
    ;; disks named disk1 (smallest), disk2, disk3 (largest)
    disk1 disk2 disk3 - disk
    ;; three pegs
    pegA pegB pegC - peg
  )

  (:init
    ;; initial stack on pegA: disk3 at bottom, disk2 on disk3, disk1 on disk2
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 pegA)

    ;; clear/top facts: only the smallest disk is clear initially and empty pegs are clear
    (clear disk1)
    (clear pegB)
    (clear pegC)
    ;; pegA is not clear (has disks on it), disk2 and disk3 are not clear
    ;; Note: absence of (clear disk2) and (clear disk3) encodes they are not clear.

    ;; size ordering: disk1 < disk2 < disk3
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk2 disk3)
  )

  (:goal (and
    ;; final stack on pegC with same relative ordering as the initial stack
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 pegC)
  ))
)