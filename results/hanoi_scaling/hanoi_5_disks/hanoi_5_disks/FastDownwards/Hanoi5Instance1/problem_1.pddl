(define (problem hanoi5-instance1)
  (:domain hanoi5)
  (:objects
    a b c d e - disk
    left middle right - peg
  )

  (:init
    ;; stacking on left (top -> bottom): a, b, c, d, e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e left)

    ;; top markers
    (top a left)

    ;; clear markers: a has no disk on top; middle and right are empty
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering: a < b < c < d < e
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ;; the same stack on right: top -> bottom = a, b, c, d, e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)

    ;; left and middle must be empty
    (clear-peg left)
    (clear-peg middle)
  ))
)