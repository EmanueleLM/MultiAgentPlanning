(define (problem hanoi-4disk-easy-scaling-1)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk
        Left Middle Right - peg
    )
    
    (:init
        (= (total-cost) 0)

        ; Static size relations: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Stack: All disks on Right peg (A top, D bottom/peg)
        (on A B)
        (on B C)
        (on C D)
        (on D Right)
        
        ; Initial Clear Status
        (clear A)
        (clear Left)
        (clear Middle)
    )
    
    (:goal (and
        ; Final State: All disks on Left peg (A top, D bottom/peg)
        (on A B)
        (on B C)
        (on C D)
        (on D Left)
    ))

    (:metric minimize (total-cost))
)