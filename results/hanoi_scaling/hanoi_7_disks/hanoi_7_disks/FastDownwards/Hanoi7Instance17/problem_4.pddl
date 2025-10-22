(define (problem Hanoi7Instance17)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; stack (top -> bottom): A,B,C,D,E,F,G on peg left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; top-of-stack / clear facts
    (clear A)
    (clear middle)
    (clear right)

    ;; initial root: all disks belong to stack rooted at left
    (root A left)
    (root B left)
    (root C left)
    (root D left)
    (root E left)
    (root F left)
    (root G left)

    ;; size ordering: smaller X Y means X is smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
  ))
)