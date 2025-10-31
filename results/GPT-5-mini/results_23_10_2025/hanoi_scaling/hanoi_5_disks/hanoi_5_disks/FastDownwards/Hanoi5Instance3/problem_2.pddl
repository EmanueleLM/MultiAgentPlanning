(define (problem hanoi-5-left-to-right)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - place
  )
  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    (clear a)
    (clear middle)
    (clear right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)
  ))
)