(define (problem hanoi-8-instance17)
  (:domain hanoi)

  (:objects
    a b c d e f g h - disk
    left_peg middle_peg right_peg - peg
  )

  (:init
    (on a left_peg)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)
    (on g f)
    (on h g)

    (clear a)
    (clear middle_peg)
    (clear right_peg)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h)
    (smaller e f) (smaller e g) (smaller e h)
    (smaller f g) (smaller f h)
    (smaller g h)
  )

  (:goal (and
    (on a right_peg)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)
    (on g f)
    (on h g)
    (clear left_peg)
    (clear middle_peg)
  ))
)