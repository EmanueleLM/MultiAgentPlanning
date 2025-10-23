(define (problem hanoi5-instance1)
  (:domain hanoi5)
  (:objects
    a b c d e - disk
    left middle right - peg
  )

  (:init
    ;; initial tower on left: A on B, B on C, C on D, D on E, E on left
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ;; top-of-peg and empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering (A smallest, E largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ;; all disks stacked on right peg in same order A on B on C on D on E
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)

    ;; other pegs empty
    (clear left)
    (clear middle)
  ))
)