(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    a b c d e - disk    ;; a = smallest, e = largest
    left middle right - peg
  )
  (:init
    ;; Initial stack on left: e (largest) bottom ... a (smallest) top
    (on e left)
    (on d e)
    (on c d)
    (on b c)
    (on a b)

    ;; Clear objects: the top disk and empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; Size ordering: a < b < c < d < e (all pairwise smaller relations)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  ;; Goal: all disks on right peg preserving order (e bottom ... a top)
  (:goal (and
    (on e right)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
  ))
)