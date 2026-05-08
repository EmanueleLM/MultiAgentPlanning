(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left mid right - peg
    A B C D - disk
  )

  (:init
    ;; initial stack on middle peg: bottom D, then C, then B, then A (A is smallest/top)
    (on D mid)
    (on C D)
    (on B C)
    (on A B)

    ;; clear places: top disk A is clear; left and right pegs are empty (clear)
    (clear A)
    (clear left)
    (clear right)

    ;; size ordering (A smallest, D largest)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; all disks moved to right peg in the correct stack order: D bottom, C on D, B on C, A on B
    (on D right)
    (on C D)
    (on B C)
    (on A B)

    ;; left and middle pegs must be empty at the end
    (clear left)
    (clear mid)
  ))
)