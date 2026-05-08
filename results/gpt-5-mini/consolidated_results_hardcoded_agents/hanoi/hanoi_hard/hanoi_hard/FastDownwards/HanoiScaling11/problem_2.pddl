(define (problem hanoi-6-instance)
  (:domain hanoi-6)
  (:objects
    A B C D E F - disk
    L M R - peg
  )

  (:init
    ;; Initial stack on middle peg M: top A ... bottom F represented by adjacent supports.
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F M)
    (top M A)

    ;; Empty pegs at start.
    (empty L)
    (empty R)

    ;; Static size ordering (all pairs where X is smaller than Y).
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; Desired final stack on right peg R: top A ... bottom F.
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F R)
    (top R A)

    ;; Other pegs empty.
    (empty L)
    (empty M)
  ))