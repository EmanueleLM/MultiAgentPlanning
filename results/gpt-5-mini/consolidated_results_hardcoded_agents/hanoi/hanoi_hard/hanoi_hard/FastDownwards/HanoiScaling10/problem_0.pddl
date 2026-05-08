(define (problem hanoi-3disks)
  (:domain hanoi)

  (:objects
    disk1 disk2 disk3 - disk
    pegA pegB pegC     - peg
  )

  ;; Initial state: all three disks stacked on pegA (disk3 largest bottom,
  ;; disk2 middle, disk1 smallest top). pegB and pegC are empty.
  (:init
    ;; immediate supports (on)
    (on disk3 pegA)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; clear (nothing on top of these places)
    (clear disk1)   ;; top-most disk has nothing on it
    (clear pegB)
    (clear pegC)

    ;; size ordering (strict)
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk2 disk3)
  )

  ;; Goal: whole stack moved to pegC with exact stacking order preserved,
  ;; and explicit final clear statuses fixed so these terminal conditions are enforced.
  (:goal (and
    ;; desired stack on pegC
    (on disk3 pegC)
    (on disk2 disk3)
    (on disk1 disk2)

    ;; explicit terminal clear states:
    ;; pegA and pegB must be empty in the final state
    (clear pegA)
    (clear pegB)
    ;; pegC must have something on it (i.e., not clear)
    (not (clear pegC))
    ;; disk1 is the top disk (nothing on it), disk2 and disk3 have disks on them
    (clear disk1)
    (not (clear disk2))
    (not (clear disk3))
  ))
)