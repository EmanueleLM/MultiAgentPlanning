(define (problem hanoi-4-instance0)
  (:domain hanoi-4)
  (:objects
    left middle right - peg
    A B C D - disk
  )

  (:init
    ; initial stack on left (top -> bottom): A B C D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)
    (top A left)
    (empty middle)
    (empty right)
    (clear A)
    ; size ordering (A smallest, D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ; goal: right peg has stack top->bottom A B C D and other pegs empty
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)
    (empty left)
    (empty middle)
  ))
)