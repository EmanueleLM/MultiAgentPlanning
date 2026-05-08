(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    a b c d - disk
  )
  (:init
    ;; initial stacked configuration on the right peg: top-to-bottom a b c d
    ;; bottom disk d is directly on the peg; others are on the disk below
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
    (top right a)

    ;; other pegs empty
    (top-peg-empty left)
    (top-peg-empty middle)

    ;; size ordering: specify immediate neighbor relations only;
    ;; the domain action 'propagate-smaller' can generate the transitive closure.
    (smaller a b)
    (smaller b c)
    (smaller c d)
  )
  (:goal (and
    ;; final stacked configuration on the left peg: top-to-bottom a b c d
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
    ;; middle and right pegs must be empty at goal
    (top-peg-empty middle)
    (top-peg-empty right)
  ))
)