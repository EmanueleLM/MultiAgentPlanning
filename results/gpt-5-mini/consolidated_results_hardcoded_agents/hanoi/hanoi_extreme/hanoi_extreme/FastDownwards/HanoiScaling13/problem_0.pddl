(define (problem hanoi-7-right-to-middle)
  (:domain hanoi)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stacking: A on B on C on D on E on F on G on right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)

    ;; only the top disk A and the empty pegs left and middle are clear
    (clear A)
    (clear left)
    (clear middle)

    ;; size ordering: A < B < C < D < E < F < G
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; final stacking: A on B on C on D on E on F on G on middle
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G middle)

      ;; left and right must be empty
      (clear left)
      (clear right)
    )
  )
)