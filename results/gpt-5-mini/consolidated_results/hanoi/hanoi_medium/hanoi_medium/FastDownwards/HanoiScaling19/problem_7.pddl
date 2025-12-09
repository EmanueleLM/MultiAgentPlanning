(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A - A_t
    B - B_t
    C - C_t
    D - D_t
    E - E_t
    left middle right - peg
  )

  (:init
    ;; initial stack on the right peg (top-to-bottom): A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; clear facts: top disk A has nothing on it; left and middle pegs are empty
    (clear A)
    (clear left)
    (clear middle)
  )

  (:goal (and
    ;; final stack on the left peg (top-to-bottom): A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; middle and right pegs must be empty at the end
    (clear middle)
    (clear right)
  ))