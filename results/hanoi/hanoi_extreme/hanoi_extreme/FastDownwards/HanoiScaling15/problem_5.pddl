(define (problem hanoi-7-disks-R-to-M)
    (:domain hanoi-minimal)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        ;; Static Size Ordering (21 facts: N*(N-1)/2)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ;; Initial Stack Structure on R (7 facts)
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G) (on G R) 
        
        ;; Initial Availability (3 facts)
        (clear A) ; A is the top disk
        (clear L) ; Left peg is empty
        (clear M) ; Middle peg is empty
    )
    (:goal (and
        ;; Target stack structure on M (7 facts)
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G) (on G M)
        
        ;; Terminal conditions: L and R must be empty (2 facts) and A must be clear (1 fact)
        (clear A)
        (clear L)
        (clear R)
    ))
)