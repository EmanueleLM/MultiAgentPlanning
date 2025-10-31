(define (problem Hanoi7Instance1)
  (:domain hanoi7)
  (:objects
    a b c d e f g
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

    (at a left)
    (at b left)
    (at c left)
    (at d left)
    (at e left)
    (at f left)
    (at g left)

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
    (clear left)
    (clear middle)
  ))
)