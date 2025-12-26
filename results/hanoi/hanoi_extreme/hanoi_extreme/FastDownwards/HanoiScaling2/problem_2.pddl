(define (problem hanoi-5-disk-to-right)
    (:domain hanoi_5_disks)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    (:init
        ; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial stack: A/B/C/D/E on Left
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Left)
        
        (is-clear A)
        
        ; Initial peg states
        (peg-empty Middle)
        (peg-empty Right)
        (not (peg-empty Left)) ; Left holds E
        
        ; Cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stack: A/B/C/D/E on Right
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Right)
        
        ; Required empty pegs
        (peg-empty Left)
        (peg-empty Middle)
    ))
    
    (:metric minimize (total-cost))
)