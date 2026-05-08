(define (problem hanoi-4)
  (:domain towers-of-hanoi)

  (:objects
    disk1 disk2 disk3 disk4 - disk
    pegA pegB pegC - peg
    operator - agent
  )

  (:init
    ; agent instance
    (agent operator)

    ; initial stack on pegA (disk4 bottom, disk1 top)
    (on disk4 pegA)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ; clear supports: only the topmost disk and empty pegs are clear
    (clear disk1)
    (clear pegB)
    (clear pegC)

    ; top-of-peg relation for pegA (disk4 is directly on pegA)
    (peg-top disk4 pegA)

    ; size ordering (smaller relations)
    (smaller disk1 disk2)
    (smaller disk1 disk3)
    (smaller disk1 disk4)
    (smaller disk2 disk3)
    (smaller disk2 disk4)
    (smaller disk3 disk4)
  )

  (:goal
    (and
      ; all disks moved to pegC in the same stacking order (disk4 bottom)
      (on disk4 pegC)
      (on disk3 disk4)
      (on disk2 disk3)
      (on disk1 disk2)

      ; pegC should reflect that disk4 is directly on it
      (peg-top disk4 pegC)

      ; topmost disk is clear
      (clear disk1)

      ; other pegs must be empty in the final state
      (clear pegA)
      (clear pegB)
    )
  )
)