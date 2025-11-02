(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; size ordering: A smallest, D largest
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; initial stack on left peg top->bottom: A, B, C, D
    (on A left)
    (on B A)
    (on C B)
    (on D C)

    ;; clear facts: A is top of the left stack; middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal (and
    ;; goal stack on right peg top->bottom: A, B, C, D
    (on A right)
    (on B A)
    (on C B)
    (on D C)
  ))
)