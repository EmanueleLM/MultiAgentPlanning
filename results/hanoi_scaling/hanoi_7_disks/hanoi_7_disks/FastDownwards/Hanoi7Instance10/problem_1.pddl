(define (problem Hanoi7Instance10)
  (:domain hanoi-sequential)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top A, then B, C, D, E, F, bottom G on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; Clear predicates: only the top disk (A) and the empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Hand is initially empty
    (handempty)

    ;; Size ordering: A < B < C < D < E < F < G (explicit pairwise relations)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; Goal: entire stack A (top) ... G (bottom) on peg right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
  ))
)