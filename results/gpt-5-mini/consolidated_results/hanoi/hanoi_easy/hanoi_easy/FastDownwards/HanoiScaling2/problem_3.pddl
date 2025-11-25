(define (problem hanoi-4-disks-left-to-right)
  (:domain hanoi)

  (:objects
    A B C D left middle right - obj
  )

  (:init
    ;; object kinds
    (disk A) (disk B) (disk C) (disk D)
    (peg left) (peg middle) (peg right)

    ;; Initial stack: bottom D on left, then C on D, then B on C, then A on B
    (on D left)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear/top facts: A is top of the left stack; middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering (explicit)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; All disks stacked on the right peg (from bottom to top: D, C, B, A)
    (on D right)
    (on C D)
    (on B C)
    (on A B)

    ;; Hard constraint: left and middle pegs must be empty
    (clear left)
    (clear middle)
  ))
)