(define (problem hanoi-6-disks-P2-to-P3)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        P1 P2 P3 - peg
    )
    
    (:init
        ; Size relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Location: All on P2 (F bottom, A top)
        (at F P2)
        (on E F) (on D E) (on C D) (on B C) (on A B)
        
        (clear A)
        (is-empty P1)
        (is-empty P3)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Goal State: All disks on P3 (F bottom, A top)
        (at F P3)
        (on E F) (on D E) (on C D) (on B C) (on A B)
        ; Pegs P1 and P2 must be empty
        (is-empty P1)
        (is-empty P2)
    ))

    (:metric minimize (total-cost))
)