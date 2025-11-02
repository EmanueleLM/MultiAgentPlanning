(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg
  )
  (:init
    ; initial stacking: top->bottom on left = a b c d e
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ; clear objects: top disk a is clear, empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)

    ; size (larger) relations (e is largest, a is smallest)
    (larger e d) (larger e c) (larger e b) (larger e a)
    (larger d c) (larger d b) (larger d a)
    (larger c b) (larger c a)
    (larger b a)
  )
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)
  ))
)