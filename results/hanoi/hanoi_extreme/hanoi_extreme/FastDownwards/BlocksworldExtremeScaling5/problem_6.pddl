(define (problem hanoi-7-disk-r-to-l)
    (:domain hanoi-7-disk)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    
    (:init
        (= (total-cost) 0)

        ; Static Size Ordering (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; Initial Configuration: Stack A-G on R (A is top, on B, B on C, ..., G on R)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G R)

        ; Clearance Status: A is on top, L and M are empty.
        (clear A) 
        (clear L) 
        (clear M)
    )

    (:goal (and
        ; Final Configuration: Stack A-G on L
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G L)
        
        ; Ensure R and M are clear bases
        (clear R)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)