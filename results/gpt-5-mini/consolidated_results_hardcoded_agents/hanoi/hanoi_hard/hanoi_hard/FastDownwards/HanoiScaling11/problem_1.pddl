(define (problem hanoi-6-instance)
  (:domain hanoi-6)
  (:objects
    A B C D E F - disk
    L M R - peg
  )

  (:init
    ;; Initial stack on Middle peg M: top A ... bottom F represented by adjacent supports.
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

    ;; Compact encoding of the size order: immediate adjacency only.
    ;; The transitive "smaller" relation is derived in the domain from these links.
    (next A B)
    (next B C)
    (next C D)
    (next D E)
    (next E F)
  )

  (:goal (and
    ;; Desired final stack on Right peg R: top A ... bottom F.
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