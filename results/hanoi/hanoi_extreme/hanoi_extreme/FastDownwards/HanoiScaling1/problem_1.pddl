(define (problem p-hanoi-4-disks)
    (:domain hanoi-4-disks)

    (:objects
        A B C D - disk
        Left Middle Right - peg
    )

    (:init
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        (on D Right)
        (on C D)
        (on B C)
        (on A B)

        (clear A) 
        (clear Left)
        (clear Middle)
        
        (= (total-cost) 0)
    )

    (:goal (and
        (on D Left)
        (on C D)
        (on B C)
        (on A B)
    ))
    
    (:metric minimize (total-cost))
)