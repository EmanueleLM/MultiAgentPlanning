(define (problem hanoi7-problem)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top-to-bottom A,B,C,D,E,F,G
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)

    ;; Clear predicates: only the top disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering (static): A is smallest, G largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; Goal: same stack order on right peg top-to-bottom A,B,C,D,E,F,G
      (on A right)
      (on B A)
      (on C B)
      (on D C)
      (on E D)
      (on F E)
      (on G F)
    )
  )
)