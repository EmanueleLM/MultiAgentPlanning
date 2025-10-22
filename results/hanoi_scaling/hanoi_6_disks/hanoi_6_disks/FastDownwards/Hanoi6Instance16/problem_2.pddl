(define (problem hanoi6-problem)
  (:domain hanoi)

  (:init
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    (clear A)
    (clear middle)
    (clear right)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)