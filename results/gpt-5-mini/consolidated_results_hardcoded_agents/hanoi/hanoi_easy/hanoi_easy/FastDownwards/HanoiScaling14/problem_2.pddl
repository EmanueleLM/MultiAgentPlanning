(define (problem hanoi-4)
  (:domain tower-of-hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
  )

  (:init
    ;; initial stack is on the middle peg from bottom to top: d (bottom), c, b, a (top)
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; peg clearness: left and right empty, middle not empty
    (clear-peg left)
    (clear-peg right)

    ;; clear-disk: only topmost disk a is clear initially
    (clear-disk a)

    ;; size ordering facts (smaller) encoded minimally (transitive relations listed explicitly)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; final stack on left peg bottom-to-top: d, c, b, a
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; middle and right pegs empty
    (clear-peg middle)
    (clear-peg right)
  ))
)