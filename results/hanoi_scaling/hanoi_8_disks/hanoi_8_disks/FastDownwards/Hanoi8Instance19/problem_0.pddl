(define (problem hanoi-8)
  (:domain hanoi-domain)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )
  (:init
    ; Initial on relations: stack on left peg with H bottom ... A top
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ; Clear supports: top disk A is clear; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ; All other supports are not listed as clear (they implicitly are false).
    ; Size ordering: A < B < C < D < E < F < G < H
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )
  (:goal (and
    ; Goal: identical stack order but on the right peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H right)
  ))
)