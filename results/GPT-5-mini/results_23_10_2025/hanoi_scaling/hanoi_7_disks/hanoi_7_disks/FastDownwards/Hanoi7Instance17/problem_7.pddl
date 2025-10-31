(define (problem hanoi7instance17)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
  )

  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g left)

    (clear a)
    (clear middle)
    (clear right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g right)
  ))
)