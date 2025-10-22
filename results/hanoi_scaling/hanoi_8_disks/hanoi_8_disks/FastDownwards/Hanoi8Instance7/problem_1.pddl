(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    left middle right - peg
    a b c d e f g h - disk
  )
  (:init
    ; initial stack on left from bottom (h) to top (a):
    (on h left)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)

    ; clear facts: only the top disk and the empty pegs are clear initially
    (clear a)
    (clear middle)
    (clear right)

    ; size ordering: a is smallest, h is largest
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
      ; entire stack moved to right preserving direct-on relations (h bottom ... a top)
      (on h right)
      (on g h)
      (on f g)
      (on e f)
      (on d e)
      (on c d)
      (on b c)
      (on a b)
    )
  )
)