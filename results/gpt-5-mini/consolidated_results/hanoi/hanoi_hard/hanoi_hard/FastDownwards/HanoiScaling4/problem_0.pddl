(define (problem hanoi6-prob)
  (:domain hanoi6)
  (:objects
    left middle right - peg
    A B C D E F - disk
  )

  (:init
    ;; Size ordering (A smallest ... F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; Initial stack on left: top-to-bottom A,B,C,D,E,F (A on B, ..., F on left)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; Peg top/empty bookkeeping
    (top left A)
    (empty middle)
    (empty right)

    ;; Clear predicates: only the top disk A is clear initially (no disk on A)
    (clear A)
  )

  ;; Goal: complete stack transferred to middle in same order; left and right empty.
  (:goal
    (and
      ;; desired on-chains
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F middle)

      ;; middle top is A
      (top middle A)

      ;; left and right must be empty
      (empty left)
      (empty right)
    )
  )
)