(define (problem hanoi-4-problem)
  (:domain hanoi-4)
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; stack on left peg: top -> bottom A B C D
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; top-of-peg and empty flags
    (top left A)
    (empty middle)
    (empty right)

    ;; size ordering (A smallest, D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; final stack on right peg: top -> bottom A B C D
    (on A B)
    (on B C)
    (on C D)
    (on D right)

    ;; left and middle must be empty
    (empty left)
    (empty middle)
  ))
)