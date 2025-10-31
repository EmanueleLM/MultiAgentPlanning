(define (problem hanoi-6-instance6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left (top->bottom): a, b, c, d, e, f
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ; tops / empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ; size ordering: a < b < c < d < e < f (all pairwise relations needed)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)
  )

  (:goal (and
    ; goal: right peg holds stack top->bottom a, b, c, d, e, f
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f right)
  ))
)