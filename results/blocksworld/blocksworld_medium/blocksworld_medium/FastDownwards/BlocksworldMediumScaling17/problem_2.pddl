(define (problem hanoi-5-r-to-m)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk ; A smallest, E largest
        Left Middle Right - peg
    )
    (:init
        ; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial Stacking on Right Peg (R: A/B/C/D/E)
        (on A B) (on B C) (on C D) (on D E)
        (on-peg E Right)
        
        ; Initial Clearance
        (clear-disk A) 

        ; Peg Status
        (empty-peg Left)
        (empty-peg Middle)
        
        ; Metric initialization
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target Stacking on Middle Peg (M: A/B/C/D/E)
        (on A B) (on B C) (on C D) (on D E)
        (on-peg E Middle)
        
        ; Target Clearance
        (clear-disk A) 
        
        ; Peg Status
        (empty-peg Left)
        (empty-peg Right)
    ))
    (:metric minimize (total-cost))
)