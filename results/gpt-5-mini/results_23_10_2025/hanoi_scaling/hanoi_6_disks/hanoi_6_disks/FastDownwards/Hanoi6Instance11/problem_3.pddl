(define (problem Hanoi6Instance11)
  (:domain hanoi6)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    (clear A)
    (clear middle)
    (clear right)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal
    (and
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right)
    )
  )
)