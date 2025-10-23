(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    left mid right - peg
  )

  (:init
    ; initial stack on left: d1 (top) on d2 on d3 on d4 on d5 on d6 on d7 (bottom on peg left)
    (on-peg d7 left)
    (on-disk d6 d7)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; clear/top indicators
    (clear-disk d1)    ; only the top disk is clear initially
    (clear-peg mid)
    (clear-peg right)

    ; size ordering (strict): smaller X Y meaning X is strictly smaller than Y
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)
  )

  (:goal (and
    ; full tower moved to right peg preserving order: d1 on d2 ... on d7 on right
    (on-peg d7 right)
    (on-disk d6 d7)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
  ))
)