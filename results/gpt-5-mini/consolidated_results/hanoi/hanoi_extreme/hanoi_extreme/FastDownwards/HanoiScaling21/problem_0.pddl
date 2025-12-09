(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    disk1 disk2 disk3 disk4 disk5 disk6 disk7 - disk
    pegA pegB pegC - peg
  )

  (:init
    ; initial stack on pegA: disk1 (smallest) on disk2 on disk3 ... on disk7 on pegA
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 disk4)
    (on disk4 disk5)
    (on disk5 disk6)
    (on disk6 disk7)
    (on disk7 pegA)

    ; clear places: only topmost disk and empty pegs are clear initially
    (clear disk1)
    (clear pegB)
    (clear pegC)

    ; size ordering: enumerate all strictly-smaller pairs (disk i smaller than disk j for i<j)
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk1 disk4)
    (smaller disk1 disk5)
    (smaller disk1 disk6)
    (smaller disk1 disk7)

    (smaller disk2 disk3)
    (smaller disk2 disk4)
    (smaller disk2 disk5)
    (smaller disk2 disk6)
    (smaller disk2 disk7)

    (smaller disk3 disk4)
    (smaller disk3 disk5)
    (smaller disk3 disk6)
    (smaller disk3 disk7)

    (smaller disk4 disk5)
    (smaller disk4 disk6)
    (smaller disk4 disk7)

    (smaller disk5 disk6)
    (smaller disk5 disk7)

    (smaller disk6 disk7)
  )

  (:goal (and
    ; all disks stacked on pegC in same order (disk1 on disk2 ... disk7 on pegC)
    (on disk1 disk2)
    (on disk2 disk3)
    (on disk3 disk4)
    (on disk4 disk5)
    (on disk5 disk6)
    (on disk6 disk7)
    (on disk7 pegC)
  ))
)