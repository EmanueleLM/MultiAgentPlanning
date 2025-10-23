(define (problem hanoi-4-instance8)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top->bottom A B C D
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; clear things: top disk A and empty pegs middle & right
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A is smallest, D is largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; goal stack on right: top->bottom A B C D
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)