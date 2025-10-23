(define (problem hanoi-6)
  (:domain orchestrator-hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top->bottom A,B,C,D,E,F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; clear objects initially: top disk A and the empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (smaller X Y means X is strictly smaller than Y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )
  (:goal (and
    ;; goal: all disks moved to right peg preserving order top->bottom A,B,C,D,E,F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)

    ;; left and middle pegs must be empty
    (clear left)
    (clear middle)
  ))
)