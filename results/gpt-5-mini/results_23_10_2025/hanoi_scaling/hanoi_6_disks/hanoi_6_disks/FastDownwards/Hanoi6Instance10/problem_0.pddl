(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top A, then B, C, D, E, bottom F on peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F left)

    ;; clear predicates: only top disk A is clear; middle and right pegs are empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; left peg is not clear because it has disks (F is on the peg)
    ;; other disks are not clear (they have a disk above them)
    ;; size ordering: A < B < C < D < E < F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; final stack on right: top A, then B, C, D, E, bottom F on peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F right)

    ;; other pegs must be empty
    (clear-peg left)
    (clear-peg middle)
  ))
)