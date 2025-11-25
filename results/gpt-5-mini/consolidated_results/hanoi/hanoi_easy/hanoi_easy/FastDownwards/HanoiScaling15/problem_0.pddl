(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 - disk
    p1 p2 p3 - peg
  )

  (:init
    ; initial stack on peg p1: d4 (bottom) <- d3 <- d2 <- d1 (top)
    (on d4 p1)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; only the top disk and empty pegs are clear initially
    (clear d1)
    (clear p2)
    (clear p3)

    ; size ordering (strict): d1 < d2 < d3 < d4 (and all implied pairs)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal
    (and
      ; all disks moved to peg p3 with correct ordering: d4 bottom, then d3, d2, d1
      (on d4 p3)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
    )
  )
)