(define (problem hanoi-6-instance)
  (:domain hanoi-6)
  (:objects
    A B C D E F - disk
    L M R - peg
  )

  (:init
    ;; Initial support relations: stack A (top) ... F (bottom) on Middle peg (M).
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F M)

    ;; Top facts: A is top of Middle; Left and Right are empty.
    (top M A)
    (empty L)
    (empty R)

    ;; Static size ordering (strict): smaller X Y iff X is strictly smaller than Y.
    ;; A < B < C < D < E < F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; Final stack must be A (top) ... F (bottom) on Right peg (R).
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F R)
    (top R A)

    ;; Both Left and Middle pegs must be empty at the goal.
    (empty L)
    (empty M)
  ))