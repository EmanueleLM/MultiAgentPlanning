(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ; Initial stacking on left peg top-to-bottom: a (top), b, c, d, e, f (bottom)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ; Other pegs are empty
    (clear middle)
    (clear right)

    ; Topmost disk on left is a
    (clear a)

    ; size ordering: a < b < c < d < e < f
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)
  )

  (:goal (and
    ; Goal: right peg holds disks top-to-bottom a, b, c, d, e, f
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f right)
  ))
)