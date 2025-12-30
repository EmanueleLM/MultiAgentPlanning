(define (problem hanoi-4disk-M-to-R)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D) 

        (on A B)
        (on B C)
        (on C D)
        (on D M)

        (clear A)
        (clear L)
        (clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on D R)
        
        (clear L)
        (clear M)
        (clear A)
    ))
    
    (:metric minimize (total-cost))
)