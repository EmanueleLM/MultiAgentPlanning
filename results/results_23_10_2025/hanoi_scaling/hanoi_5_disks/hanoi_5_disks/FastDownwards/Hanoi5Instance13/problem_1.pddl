(define (problem hanoi5instance13-problem)
  (:domain hanoi5instance13)

  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top A, then B, then C, then D, then E on peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; currently only the topmost disk A and the empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ;; final stack on right: top A, then B, then C, then D, then E on peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; left and middle pegs empty
    (clear left)
    (clear middle)
    ;; top disk A is clear at the top of the tower
    (clear A)
  ))
)