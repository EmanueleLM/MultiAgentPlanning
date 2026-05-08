(define (problem hanoi-5-peg3-prob)
  (:domain hanoi-5-peg3)
  (:objects
    p1 p2 p3 - peg
    d1 d2 d3 d4 d5 - disk
  )

  (:init
    ; initial on-chain: smallest d1 on d2, ..., d4 on d5, d5 on peg p1
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 p1)

    ; location: all start on peg p1
    (located d1 p1)
    (located d2 p1)
    (located d3 p1)
    (located d4 p1)
    (located d5 p1)

    ; top-of-peg for source peg p1 is smallest disk d1
    (top-of-peg d1 p1)

    ; clear indicates nothing on top of d1
    (clear d1)
    ; disks below d1 are not listed as clear (implicitly false)
    ; peg occupancy flags
    (empty p2)
    (empty p3)

    ; size ordering (d1 is smallest, d5 largest)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal (and
    ; final tower must be fully on peg p3 with correct stacking order
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 p3)

    ; each disk must be located on peg p3
    (located d1 p3)
    (located d2 p3)
    (located d3 p3)
    (located d4 p3)
    (located d5 p3)

    ; final top-of-peg and emptiness constraints
    (top-of-peg d1 p3)
    (empty p1)
    (empty p2)
  ))
)