(define (problem hanoi-7)
  (:domain hanoi)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on peg middle (G is bottom, then F, E, D, C, B, A on top)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G middle)

    ;; clear statuses: only top-most disk A is clear; pegs left/right start clear, middle not
    (clear-disk A)
    ;; B..G are not listed as clear initially (they are covered) -- absence implies not clear
    (clear-peg left)
    (clear-peg right)
    ;; middle has G on it, so not clear

    ;; full explicit size ordering (static facts). A is smallest, G is largest.
    ;; all ordered pairs (X,Y) with X smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; goal: the entire tower moved to peg right in the same order (G bottom ... A top)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg  G right)
  ))
)