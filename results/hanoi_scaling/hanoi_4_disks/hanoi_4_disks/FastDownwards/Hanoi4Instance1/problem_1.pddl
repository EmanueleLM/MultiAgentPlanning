(define (problem Hanoi4Instance1)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; Initial tower on left: top A, then B, then C, then D on peg left
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; Clear: top disk A is clear; the empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Size relations (A smallest, then B, then C, then D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )
  (:goal (and
    ;; Goal: full tower moved to right peg in same order top-to-bottom A B C D
    (on A B)
    (on B C)
    (on C D)
    (on D right)

    ;; Other pegs empty
    (clear left)
    (clear middle)
  ))
)