(define (problem hanoi-7-to-M)
    (:domain hanoi-7-disks-strips)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; --- Static Size Hierarchy (A < B < C < D < E < F < G) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; --- Initial Configuration (All on R: G->F->E->D->C->B->A) ---
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G)
        (on-peg G R)

        ; --- Location Tracking: All disks start on R ---
        (is-on A R) (is-on B R) (is-on C R) (is-on D R) (is-on E R) (is-on F R) (is-on G R)
        
        ; --- Clearance ---
        (clear-disk A)
        (clear-peg L)
        (clear-peg M)
    )

    (:goal (and
        ; Target stack on M: G->F->E->D->C->B->A
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G)
        (on-peg G M)
        
        ; All disks must be confirmed on M
        (is-on A M) (is-on B M) (is-on C M) (is-on D M) (is-on E M) (is-on F M) (is-on G M)
        
        ; L and R must be empty (clear)
        (clear-peg L) 
        (clear-peg R)
    ))
    
    (:metric minimize (total-cost))
)