(define (problem Hanoi4Instance7)
  (:domain hanoi)

  (:objects
    a b c d - disk
    left middle right - peg
  )

  (:init
    ;; Disk locations: top-to-bottom on left: a, b, c, d
    (on a left)
    (on b left)
    (on c left)
    (on d left)

    ;; Immediate-above (adjacency) relationships (top -> below)
    (above a b)
    (above b c)
    (above c d)

    ;; Top and bottom markers for left peg
    (top a left)
    (bottom d left)

    ;; Other pegs empty
    (empty middle)
    (empty right)

    ;; Size ordering facts: a < b < c < d (all required comparisons)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; all disks moved to right in correct order top-to-bottom a,b,c,d
    (on a right)
    (on b right)
    (on c right)
    (on d right)

    (above a b)
    (above b c)
    (above c d)

    (top a right)
    (bottom d right)

    ;; other pegs empty
    (empty left)
    (empty middle)
  ))
)