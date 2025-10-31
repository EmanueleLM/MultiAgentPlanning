(define (problem hanoi-8-instance10)
  (:domain hanoi8instance10)
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

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h right)
      (clear left)
      (clear middle)
      (clear a)
    )
  )
)