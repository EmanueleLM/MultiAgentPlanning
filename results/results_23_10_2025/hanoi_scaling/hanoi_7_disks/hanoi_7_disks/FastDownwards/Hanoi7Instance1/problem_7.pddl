(define (problem Hanoi7Instance1)
  (:domain hanoi7)
  (:objects
    A B C D E F G left middle right
  )

  (:init
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    (clear A)
    (clear middle)
    (clear right)

    (at A left)
    (at B left)
    (at C left)
    (at D left)
    (at E left)
    (at F left)
    (at G left)

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
    (clear left)
    (clear middle)
  ))
)