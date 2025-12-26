(define (problem hanoi-7-disks-P2-to-P3)
    (:domain hanoi-7-disks)
    (:objects
        A B C D E F G - disk
        P1 P2 P3 - peg
    )
    
    (:init
        ; Size relations (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; Initial Location: All on P2 (G bottom, A top)
        (at G P2)
        (on F G) (on E F) (on D E) (on C D) (on B C) (on A B)
        
        (clear A)
        (is-empty P1)
        (is-empty P3)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Goal State: All disks on P3 (G bottom, A top)
        (at G P3)
        (on F G) (on E F) (on D E) (on C D) (on B C) (on A B)
        ; Pegs P1 and P2 must be empty
        (is-empty P1)
        (is-empty P2)
    ))

    (:metric minimize (total-cost))
)