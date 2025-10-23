(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; Place relations (top-to-bottom A, B, C, D, E, F, G on left)
    ; Using on(X Y) : X is directly on Y
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ; Clear facts: A is clear (nothing on A). Peg middle and peg right are clear.
    (clear A)
    (clear middle)
    (clear right)

    ; Peg left is not clear because G is on it (no explicit not needed in init - absence implies false),
    ; but we include clear facts only for true ones.

    ; Smaller relations (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ; Goal: full stack top-to-bottom A,B,C,D,E,F,G on right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
    ; Ensure left and middle pegs are empty i.e., no disk directly on them.
    ; Since we cannot state "no disk on left" directly in conjunction here, the desired on-relations
    ; for right imply disks are on right; that leaves left and middle without disks directly on them.
    ))
)