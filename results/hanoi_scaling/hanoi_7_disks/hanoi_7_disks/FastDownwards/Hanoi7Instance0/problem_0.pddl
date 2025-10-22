(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left: top a on b on c on d on e on f on g on left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g left)

    ; clear supports: only the top disk a is clear; middle and right pegs are empty (clear)
    (clear a)
    (clear middle)
    (clear right)

    ; size ordering: a < b < c < d < e < f < g
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)
  )

  (:goal
    (and
      ; goal stack on right: a on b on c on d on e on f on g on right
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g right)
    )
  )
)