(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left peg: top A, then B, then C, D, E, F, bottom G on peg left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; only the top disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A is smallest, G is largest). List all strict pairs d1 < d2.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  ;; Goal: identical ordered stack on right peg; left and middle must be empty.
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
    ;; top disk is clear and intermediate pegs left and middle are empty
    (clear A)
    (clear left)
    (clear middle)
  ))
)