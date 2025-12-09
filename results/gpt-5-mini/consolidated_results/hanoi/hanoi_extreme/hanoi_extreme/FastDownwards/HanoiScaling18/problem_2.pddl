(define (problem hanoi-7-problem)
  (:domain hanoi-7)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left peg: from top to bottom A, B, C, D, E, F, G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ; top / clear facts: only A is the top disk on its stack; middle and right are empty
    (clear A)
    (clear middle)
    (clear right)

    ; immediate size-successor chain (compact encoding of disk ordering)
    (next A B)
    (next B C)
    (next C D)
    (next D E)
    (next E F)
    (next F G)
  )

  (:goal (and
    ; goal: entire stack replicated on middle peg in same order A..G (A top)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G middle)

    ; left and right pegs must be empty
    (clear left)
    (clear right)
  ))
)