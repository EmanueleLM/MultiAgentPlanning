(define (problem hanoi-4-disks-L-to-M)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        L M R - peg
    )

    (:init
        (= (total-cost) 0)
        
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        (on A B)
        (on B C)
        (on C D)
        (on D L) 

        (clear A) 
        (clear M) 
        (clear R)
    )

    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on D M)
        
        (clear L)
        (clear R)
    ))
    
    (:metric minimize (total-cost))
)