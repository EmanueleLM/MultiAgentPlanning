(define (problem hanoi-4-disks)
  (:domain tower-of-hanoi)
  (:objects
    d1 d2 d3 d4 - disk
    peg-left peg-mid peg-right - peg
  )

  (:init
    ; initial stack on left peg (d4 bottom, then d3, d2, d1 top)
    (on d4 peg-left)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; clear indicates no disk on top: only top-most disk and empty pegs are clear
    (clear d1)
    (clear peg-mid)
    (clear peg-right)

    ; size ordering (strict): d1 < d2 < d3 < d4
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal (and
    ; goal: all disks stacked on right peg in same order (d4 bottom ... d1 top)
    (on d4 peg-right)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)