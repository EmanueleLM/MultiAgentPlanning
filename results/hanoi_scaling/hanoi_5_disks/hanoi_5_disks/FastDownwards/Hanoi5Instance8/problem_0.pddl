(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D E - disk
  )

  (:init
    ;; initial stack on left: top-to-bottom A B C D E
    (on-disk-d A B)
    (on-disk-d B C)
    (on-disk-d C D)
    (on-disk-d D E)
    (on-disk E left)

    ;; clear/top indicators: only top disk A is clear; middle and right pegs are empty (clear)
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; size relations (strict ordering): A < B < C < D < E
    ;; A smaller than:
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    ;; B smaller than:
    (smaller B C) (smaller B D) (smaller B E)
    ;; C smaller than:
    (smaller C D) (smaller C E)
    ;; D smaller than:
    (smaller D E)
  )

  (:goal (and
    ;; final stack on right: top-to-bottom A B C D E
    (on-disk A right)     ;; note: to be consistent with the chain representation we specify full chain below
    ;; More explicit chain (bottom E on peg right, then D on E, C on D, B on C, A on B)
    (on-disk E right)
    (on-disk-d D E)
    (on-disk-d C D)
    (on-disk-d B C)
    (on-disk-d A B)

    ;; left and middle pegs must be empty (clear)
    (clear-peg left)
    (clear-peg middle)
  ))
)