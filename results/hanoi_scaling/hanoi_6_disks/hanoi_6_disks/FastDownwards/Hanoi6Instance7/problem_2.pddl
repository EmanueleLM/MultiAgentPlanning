(define (problem hanoi-6)
  (:domain hanoi)

  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    (clear a)
    (clear middle)
    (clear right)

    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller a e)
    (smaller a f)

    (smaller b c)
    (smaller b d)
    (smaller b e)
    (smaller b f)

    (smaller c d)
    (smaller c e)
    (smaller c f)

    (smaller d e)
    (smaller d f)

    (smaller e f)
  )

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f right)
    )
  )
)