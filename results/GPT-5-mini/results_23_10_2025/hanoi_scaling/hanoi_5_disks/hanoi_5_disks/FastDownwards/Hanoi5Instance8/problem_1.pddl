(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D E - disk
  )

  (:init
    ;; initial stack on left (top -> bottom): A B C D E
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E left)

    ;; only top disk A is clear; middle and right pegs are empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; size relations (strict ordering): A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ;; final stack on right (top -> bottom): A B C D E
    (on-peg E right)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; left and middle pegs empty
    (clear-peg left)
    (clear-peg middle)
  ))
)