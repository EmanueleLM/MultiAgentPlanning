(define (problem hanoi-5)
  (:domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  (:objects
    a b c d1 d2 d3 d4 d5 - object
  )

  (:init
    ; type declarations
    (peg a) (peg b) (peg c)
    (disk d1) (disk d2) (disk d3) (disk d4) (disk d5)

    ; initial tower on peg a: bottom d5, then d4, d3, d2, top d1
    (on d5 a)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; clear places: top disk and empty pegs b and c
    (clear d1)
    (clear b)
    (clear c)

    ; size ordering: d1 < d2 < d3 < d4 < d5 (all pairwise)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal (and
    (on d5 c)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)