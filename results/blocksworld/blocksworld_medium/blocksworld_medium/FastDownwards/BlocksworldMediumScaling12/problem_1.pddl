(define (problem hanoi-5-right-to-left)
    (:domain hanoi-5disks)
    (:objects
        A - disk
        B - disk
        C - disk
        D - disk
        E - disk
        Left Middle Right - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ; Size Hierarchy
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial placement on Right peg
        (on-peg E Right)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Clarity status
        (clear-disk A)
        (clear-peg Left)
        (clear-peg Middle)
    )
    
    (:goal (and
        (on-peg E Left)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
    ))
    
    (:metric minimize (total-cost))
)