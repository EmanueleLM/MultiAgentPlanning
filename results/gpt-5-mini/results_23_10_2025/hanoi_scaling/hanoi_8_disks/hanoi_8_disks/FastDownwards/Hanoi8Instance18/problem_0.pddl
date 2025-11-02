(define (problem hanoi-8)
  (:domain hanoi)
  ; Objects: eight disks (A smallest ... H largest) and three pegs: left, middle, right.
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ; Initial stack on peg_left: top-to-bottom A B C D E F G H
    ; Represented as direct 'on' relations: A on B, B on C, ..., G on H, H on left.
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ; Only the topmost disk A and empty pegs middle and right are clear initially.
    (clear A)
    (clear middle)
    (clear right)

    ; Size ordering facts derived from agent descriptions:
    ; A < B < C < D < E < F < G < H
    ; (smaller x y) for every pair x strictly smaller than y.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  ; Goal: move entire stack from left to right preserving top-to-bottom order A B C D E F G H on peg right.
  (:goal (and
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