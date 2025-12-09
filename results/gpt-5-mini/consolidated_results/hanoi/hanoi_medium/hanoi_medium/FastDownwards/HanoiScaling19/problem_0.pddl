(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; typing facts (for clarity / static)
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (peg left) (peg middle) (peg right)

    ;; size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; Initial immediate-support chain on the right peg: top-to-bottom A,B,C,D,E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; clear facts: objects with nothing immediately on them
    (clear A)
    (clear left)
    (clear middle)
    ;; Note: E and right are not clear because D is on E and E is on right respectively.
    ;; B, C, D, E, right are false for clear by default.

    ;; empty pegs
    (empty left)
    (empty middle)
    ;; right is not empty (has E directly on it)
  )

  (:goal (and
    ;; final chain on the left peg: A (top) on B, B on C, C on D, D on E, E on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; both other pegs must be empty
    (empty middle)
    (empty right)
  ))