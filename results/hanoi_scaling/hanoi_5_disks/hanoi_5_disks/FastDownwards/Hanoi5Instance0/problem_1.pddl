(define (problem hanoi-5-instance0)
  (:domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; initial tower on left: bottom E, then D, C, B, top A
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; clear objects: top disk A and empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ; size ordering: A < B < C < D < E (pairwise)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    (on E right)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)