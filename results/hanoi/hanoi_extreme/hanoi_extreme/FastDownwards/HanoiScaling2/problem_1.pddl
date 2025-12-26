(define (problem hanoi-5-disk-to-right)
    (:domain hanoi_5_disks)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    (:init
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Left)
        
        (is-clear A)
        (peg-empty Middle)
        (peg-empty Right)
        
        (= (total-cost) 0)
    )
    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Right)
    ))
    
    (:metric minimize (total-cost))
)