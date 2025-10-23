(define (problem hanoi-3-disks)
  (:domain hanoi)
  (:objects
    disk_1 disk_2 disk_3 - disk
    peg_a peg_b peg_c - peg
  )
  (:init
    ; initial tower on peg_a: disk_3 bottom, disk_2 middle, disk_1 top
    (on disk_1 disk_2)
    (on disk_2 disk_3)
    (on disk_3 peg_a)

    ; clear/top facts
    (clear disk_1)
    (clear peg_b)
    (clear peg_c)

    ; static size ordering: disk_1 < disk_2 < disk_3
    (smaller disk_1 disk_2)
    (smaller disk_1 disk_3)
    (smaller disk_2 disk_3)
  )

  (:goal (and
    ; goal: entire stack moved to peg_c preserving order
    (on disk_1 disk_2)
    (on disk_2 disk_3)
    (on disk_3 peg_c)
  ))
)