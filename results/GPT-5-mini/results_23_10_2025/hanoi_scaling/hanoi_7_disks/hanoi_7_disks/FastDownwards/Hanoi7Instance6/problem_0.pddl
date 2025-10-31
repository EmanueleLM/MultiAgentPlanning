(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; initial stacked configuration (top-to-bottom A..G on left peg)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ; only the top-most disk is clear at start
    (clear A)

    ; pegs middle and right are empty (clear)
    (clear middle)
    (clear right)

    ; hand is initially empty
    (handempty)

    ; size ordering: smaller facts (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ; goal: full ordered stack A..G on right peg (top-to-bottom A..G)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
  ))
)