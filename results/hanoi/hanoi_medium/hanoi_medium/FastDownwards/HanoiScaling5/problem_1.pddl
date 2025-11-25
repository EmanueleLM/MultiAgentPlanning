(define (problem hanoi-5-problem)
  (:domain hanoi-5)

  (:objects
    ;; disks: a is smallest, e is largest
    a b c d e - disk

    ;; three pegs
    left mid right - peg
  )

  (:init
    ;; initial stacking on the right peg (bottom -> top): e, d, c, b, a
    (on e right)
    (on d e)
    (on c d)
    (on b c)
    (on a b)

    ;; clear facts: top disk a is clear; left and mid pegs are empty (clear)
    (clear a)
    (clear left)
    (clear mid)
    ;; right peg is not clear (has stack), so no (clear right) fact

    ;; size ordering: a < b < c < d < e
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal
    (and
      ;; all disks stacked on the left peg in correct order (bottom -> top): e, d, c, b, a
      (on e left)
      (on d e)
      (on c d)
      (on b c)
      (on a b)

      ;; top disk a must be clear (nothing on top)
      (clear a)

      ;; middle and right pegs must be empty again (no disk directly on them)
      (clear mid)
      (clear right)
    )
  )
)