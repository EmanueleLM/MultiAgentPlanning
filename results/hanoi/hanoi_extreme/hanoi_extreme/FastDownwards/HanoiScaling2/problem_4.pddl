(define (problem hanoi-5-disk-to-right)
    (:domain hanoi_5_disks_optimized)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    (:init
        ; Size definitions (5 assignments instead of 10 'smaller' facts)
        (= (size A) 1) ; Smallest
        (= (size B) 2)
        (= (size C) 3)
        (= (size D) 4)
        (= (size E) 5) ; Largest
        
        ; Initial stack: A/B/C/D/E on Left (6 facts)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Left)
        (is-clear A)
        
        ; Initial peg states (2 facts)
        (peg-empty Middle)
        (peg-empty Right)
        
        ; Cost initialization
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal stack definition
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