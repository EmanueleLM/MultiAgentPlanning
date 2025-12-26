(define (problem hanoi-7-disks-R-to-M)
    (:domain hanoi-minimal)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        ; Size ordering (Static - 21 facts)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ; Initial stack structure on R (7 facts: G/F/E/D/C/B/A)
        (on G R) 
        (on F G) 
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B) 
        
        ; Clear status (3 facts)
        (clear A) ; A is the top disk
        (clear L) ; L is empty
        (clear M) ; M is empty
    )
    (:goal (and
        ; Target stack structure on M 
        (on G M)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Terminal conditions: L and R must be empty
        (clear A) ; A is on top of M stack
        (clear L)
        (clear R)
    ))
)