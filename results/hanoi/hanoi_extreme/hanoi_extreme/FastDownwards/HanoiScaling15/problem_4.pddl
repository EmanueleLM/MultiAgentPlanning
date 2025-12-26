(define (problem hanoi-7-disks-R-to-M)
    (:domain hanoi-minimal)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        ; Size ordering (Static)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ; Initial stack structure on R (top to bottom: A, B, C, D, E, F, G)
        (on A B) 
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G R) 
        
        ; Clear status
        (clear A) ; A is the top disk
        (clear L) ; L is empty
        (clear M) ; M is empty
    )
    (:goal (and
        ; Target stack structure on M 
        (on A B) 
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G M)
        
        ; Terminal conditions: L and R must be empty
        (clear A)
        (clear L)
        (clear R)
    ))
)