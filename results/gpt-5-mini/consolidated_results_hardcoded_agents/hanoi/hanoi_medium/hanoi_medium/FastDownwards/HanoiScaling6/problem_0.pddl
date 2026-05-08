(define (problem hanoi-5-3)
  (:domain tower-of-hanoi)
  (:objects
    d1 d2 d3 d4 d5 - disk
    p1 p2 p3 - peg
  )
  (:init
    ; size ordering: d1 smallest, d5 largest
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ; initial stack on peg p1: bottom d5, then d4, d3, d2, top d1
    (on d5 p1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; top disk is d1
    (clear d1)

    ; peg occupancy flags
    (empty p2)
    (empty p3)
    ; p1 is not declared empty (absence indicates false)
  )

  (:goal (and
    ; final complete stack on peg p3 with same ordering (d5 bottom -> d1 top)
    (on d5 p3)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
    ; ensure the middle peg (p2) is empty as required
    (empty p2)
  ))
)