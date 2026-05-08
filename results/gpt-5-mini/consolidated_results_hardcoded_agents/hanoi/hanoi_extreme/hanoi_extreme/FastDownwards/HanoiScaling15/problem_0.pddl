(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    a b c - peg
  )

  (:init
    ; initial stack on peg a: bottom d7, then d6,..., top d1
    (on-peg d7 a)
    (on-disk d6 d7)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; top disk of peg a is d1
    (top a d1)
    ; pegs b and c start empty
    (empty b)
    (empty c)

    ; only the smallest disk is initially clear (top of the stack)
    (clear d1)

    ; size ordering: d1 < d2 < ... < d7
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)
  )

  (:goal (and
    ; all disks stacked on peg c in the same order: bottom d7 ... top d1
    (on-peg d7 c)
    (on-disk d6 d7)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; final top and emptiness conditions
    (top c d1)
    (empty a)
    (empty b)
  ))
)