(define (problem hanoi-6-disks)
    (:domain tower-of-hanoi-6)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        ; Size Ordering (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial State: All on Middle (M), F at bottom, A at top.
        (on F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Clearances (A is top disk, L and R pegs are clear)
        (clear A)
        (clear L) 
        (clear R) 
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: All on Right (R), F at bottom, A at top.
        (on F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Ensure M and L are empty (implied by goals and movement rules, but added for explicit completeness)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)