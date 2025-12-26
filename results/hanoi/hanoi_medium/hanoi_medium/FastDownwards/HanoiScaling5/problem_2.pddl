(define (problem hanoi-5-r-to-l)
  (:domain hanoi-5-disks)
  (:objects
    A B C D E - disk ; A smallest, E largest
    L M R - peg      ; Left, Middle, Right
  )

  (:init
    ; 10 facts: Transitive Size Ordering (A < B < C < D < E)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ; 5 facts: Initial Stack on R (A/B/C/D/E Top to bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on-peg E R)

    ; 1 fact: Clearance status
    (clear A)
    
    ; 2 facts: Peg Status (L and M are empty. R is implicitly non-empty.)
    (empty L)
    (empty M)
  )

  (:goal (and
    ; Final stack on L: A/B/C/D/E (Top to bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on-peg E L)
    
    ; Other pegs must be empty
    (empty R)
    (empty M)
  ))
)