```pddl
(define (problem hanoi-6-p2-to-p3)
    (:domain hanoi-6-disks)
    (:objects
        P1 P2 P3 - peg
        A B C D E F - disk ; A=smallest, F=largest
    )
    (:init
        ; Size relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial setup on P2 (Middle Peg)
        ; Stack: F (base), E, D, C, B, A (top)
        
        ; Base disk F on P2
        (on-peg F P2)

        ; Stacked disks
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Clear status: A is clear
        (clear A)

        ; Peg status
        (empty P1)
        (empty P3)
    )
    (:goal (and
        ; Target stack on P3
        (on-peg F P3)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        ; A must be clear
        (clear A)
        ; All auxiliary pegs must be empty
        (empty P1)
        (empty P2)
    ))
)
```