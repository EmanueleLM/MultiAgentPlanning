(define (problem hanoi-4-instance)
  (:domain hanoi-4-disk)

  (:objects
    ;; disks: D1 is smallest, D4 is largest
    D1 D2 D3 D4 - disk
    ;; pegs
    A B C - peg
    ;; agents
    mover auditor observer - agent
  )

  (:init
    ;; Initial stack on peg A (D1 on D2, D2 on D3, D3 on D4, D4 on peg A)
    (on D1 D2)
    (on D2 D3)
    (on D3 D4)
    (on D4 A)

    ;; Clear facts: a place is clear iff no disk is directly on it.
    ;; Initially top disk is D1; pegs B and C are empty.
    (clear D1)
    (clear B)
    (clear C)

    ;; Size ordering facts (static): smaller d1 d2 means d1 is strictly smaller than d2.
    ;; Provide all pairwise facts necessary to enforce ordering constraints.
    (smaller D1 D2)
    (smaller D1 D3)
    (smaller D1 D4)
    (smaller D2 D3)
    (smaller D2 D4)
    (smaller D3 D4)
  )

  ;; Goal: all disks moved to peg C in the same stacked order (D1 on D2 on D3 on D4 on C).
  ;; Also require pegs A and B to be empty (explicit terminal conditions).
  (:goal (and
           (on D1 D2)
           (on D2 D3)
           (on D3 D4)
           (on D4 C)
           (clear A)
           (clear B)
         ))
)