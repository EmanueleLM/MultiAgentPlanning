(define (problem hanoi-5)
  (:domain tower-of-hanoi)

  (:objects
    d1 d2 d3 d4 d5 - disk
    p1 p2 p3 - peg
  )

  (:init
    ; initial stack on peg p1: bottom d5 on peg, then d4 on d5, d3 on d4, d2 on d3, d1 on d2
    (on-peg d5 p1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; clear markers: only the topmost disk and empty pegs are clear
    (clear-disk d1)
    (clear-disk d2) ; will be set false by stacking facts below; explicitly set false entries are omitted in :init (they are false by default)
    ; note: we include only positive facts; disks that are covered are not declared clear
    ; pegs clear status
    (clear-peg p2)
    (clear-peg p3)
    ; p1 is not clear because d5 is on it

    ; static size ordering (smaller relations): d1 is smallest, d5 largest
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal
    (and
      ; final stack on peg p3: bottom d5 on peg p3, then d4 on d5, d3 on d4, d2 on d3, d1 on d2
      (on-peg d5 p3)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
    )
  )
)