(define (problem Hanoi5Instance15-problem)
  (:domain hanoi5)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top -> bottom A, B, C, D, E
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)

    ;; only top disk A is clear and the two empty pegs are clear
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
    ;; goal stack on right: top -> bottom A, B, C, D, E
    (on A right)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
  ))
)