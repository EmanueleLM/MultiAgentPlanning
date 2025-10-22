(define (problem hanoi-5-left-to-right)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top->bottom A,B,C,D,E represented as on relations
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ;; only the top disk and empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering (smaller X Y means X is smaller than Y)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ;; goal: right peg has stack top->bottom A,B,C,D,E
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)
  ))
)