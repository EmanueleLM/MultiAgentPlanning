(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg
  )

  (:init
    ; initial stacking on left: top -> bottom = a, b, c, d, e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e left)

    ; top facts: 'a' is currently the top disk on left
    (top a left)

    ; clear markers: 'a' has no disk on top; middle and right pegs are empty
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ; size ordering (smaller X Y means X is strictly smaller than Y)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ; all disks moved to right peg in same top->bottom order a,b,c,d,e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)

    ; left and middle pegs must be empty
    (clear-peg left)
    (clear-peg middle)
  ))
)