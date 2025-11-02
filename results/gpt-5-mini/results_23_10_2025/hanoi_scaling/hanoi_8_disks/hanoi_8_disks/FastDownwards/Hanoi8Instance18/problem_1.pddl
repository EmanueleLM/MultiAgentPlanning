(define (problem hanoi-8-problem)
  (:domain hanoi-8-domain)

  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ; Initial stack on left peg: top-to-bottom A B C D E F G H
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg H left)

    ; Clear facts: only top disk A is clear; middle and right pegs are empty (clear).
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; Size ordering: A is smallest, H largest.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  ; Goal: full stack moved to the right peg with same top-to-bottom order A (top) ... H (bottom).
  ; Note: the goal intentionally mirrors the initial on-predicates but on the right peg.
  (:goal (and
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg H right)
  ))
)