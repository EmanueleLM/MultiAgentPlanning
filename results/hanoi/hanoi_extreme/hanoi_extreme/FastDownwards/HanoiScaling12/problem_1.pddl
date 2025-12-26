(define (problem hanoi-p6-LMR)
    (:domain hanoi-scaling-12)
    (:objects
        L M R - peg
        A B C D E F - disk
    )
    (:init
        ; Initial location: All disks F->A stacked on R (Right peg)
        (on F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Clear objects
        (clear A) ; Top disk
        (clear L) ; Empty peg
        (clear M) ; Empty peg
        
        ; Size relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Goal location: All disks F->A stacked on L (Left peg)
        (on F L)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
    ))
    
    (:metric minimize (total-cost))
)