(define (problem hanoi-p6-LMR)
    (:domain hanoi-scaling-12)
    (:objects
        L M R - peg
        A B C D E F - disk
    )
    (:init
        ; --- Location Facts ---
        ; Initial stack: A/B/C/D/E/F on R (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F R)
        
        ; --- Clear Status ---
        (clear A) ; A is on top
        (clear L) ; L is empty
        (clear M) ; M is empty
        
        ; --- Size Relations (A < B < C < D < E < F) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Goal stack: A/B/C/D/E/F on L (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F L)
        
        ; Ensure intermediate pegs are empty
        (clear R)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)