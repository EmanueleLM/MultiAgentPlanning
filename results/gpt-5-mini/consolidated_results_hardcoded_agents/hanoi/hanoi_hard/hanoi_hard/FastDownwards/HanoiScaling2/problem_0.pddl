(define (problem hanoi-6disk-problem)
  (:domain hanoi-6disk)
  ; Objects: pegs and six disks (disk1 is smallest, disk6 largest).
  (:objects
    pegA pegB pegC - peg
    disk1 disk2 disk3 disk4 disk5 disk6 - disk
  )

  ; Initial state:
  ; Classic configuration: all disks stacked on pegA with disk6 at bottom .. disk1 on top.
  ; Only disk1 is clear (topmost). PegA is not clear, pegB and pegC are clear.
  (:init
    ; location facts (initial stack on pegA)
    (on-peg disk6 pegA)
    (on-disk disk5 disk6)
    (on-disk disk4 disk5)
    (on-disk disk3 disk4)
    (on-disk disk2 disk3)
    (on-disk disk1 disk2)

    ; clear facts
    (clear-disk disk1)
    (clear-peg pegB)
    (clear-peg pegC)
    ; pegA is not clear (no fact), disks 2-6 are not clear (no facts)

    ; static size ordering: disk1 < disk2 < ... < disk6
    (smaller disk1 disk2) (smaller disk1 disk3) (smaller disk1 disk4) (smaller disk1 disk5) (smaller disk1 disk6)
    (smaller disk2 disk3) (smaller disk2 disk4) (smaller disk2 disk5) (smaller disk2 disk6)
    (smaller disk3 disk4) (smaller disk3 disk5) (smaller disk3 disk6)
    (smaller disk4 disk5) (smaller disk4 disk6)
    (smaller disk5 disk6)
  )

  ; Goal: move the entire stack (all disks) to pegC preserving order (disk6 bottom .. disk1 top).
  ; The goal explicitly fixes the final locations for every disk (no auxiliary bookkeeping).
  (:goal (and
    (on-peg disk6 pegC)
    (on-disk disk5 disk6)
    (on-disk disk4 disk5)
    (on-disk disk3 disk4)
    (on-disk disk2 disk3)
    (on-disk disk1 disk2)
  ))
)