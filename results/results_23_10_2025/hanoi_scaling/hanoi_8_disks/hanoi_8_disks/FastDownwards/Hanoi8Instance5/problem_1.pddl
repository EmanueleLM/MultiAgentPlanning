(define (problem Hanoi8Instance5)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D E F G H - disk
  )
  (:init
    ;; Initial left peg stack top->bottom: A, B, C, D, E, F, G, H
    ;; Represented as A on B, B on C, ..., G on H, and H on peg left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg  H left)

    ;; Only the top disk A is clear initially; middle and right pegs are empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Size ordering: A < B < C < D < E < F < G < H
    ;; Include all pairwise 'smaller' facts where the first is strictly smaller than the second.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )
  (:goal (and
    ;; Goal: entire stack moved intact to the right peg top->bottom: A, B, C, D, E, F, G, H
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg  H right)
  ))
)