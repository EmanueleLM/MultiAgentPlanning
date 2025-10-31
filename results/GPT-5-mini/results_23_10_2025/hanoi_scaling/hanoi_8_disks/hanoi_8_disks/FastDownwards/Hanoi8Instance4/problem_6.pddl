(define (problem Hanoi8Instance4)
  (:domain hanoi)
  (:objects
    a b c d e f g h - disk
    left middle right - peg
  )

  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h left)

    (clear a)
    (clear middle)
    (clear right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h)
    (smaller e f) (smaller e g) (smaller e h)
    (smaller f g) (smaller f h)
    (smaller g h)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h right)

    (not (on a left))  (not (on b left))  (not (on c left))  (not (on d left))
    (not (on e left))  (not (on f left))  (not (on g left))  (not (on h left))

    (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on d middle))
    (not (on e middle)) (not (on f middle)) (not (on g middle)) (not (on h middle))
  ))
)