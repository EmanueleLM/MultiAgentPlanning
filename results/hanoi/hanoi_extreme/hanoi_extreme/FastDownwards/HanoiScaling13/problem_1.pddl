(define (problem hanoi-7-to-M)
    (:domain hanoi-7-disks-strips)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
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

        ; --- Clearance ---
        (clear-disk A) ; Top disk
        (clear-peg L)  ; Empty peg
        (clear-peg M)  ; Empty peg
        
        ; Disks B-G and Peg R are implicitly not clear.
    )

    (:goal (and
        ; Target stack on M: G->F->E->D->C->B->A
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G)
        (on-peg G M)
        
        ; L and R must be empty (clear)
        (clear-peg L) 
        (clear-peg R)
    ))
)