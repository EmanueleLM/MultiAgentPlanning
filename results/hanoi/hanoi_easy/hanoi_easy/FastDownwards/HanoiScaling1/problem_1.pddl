(define (problem hanoi-4disk-p)
    (:domain hanoi-4disk)
    (:objects
        a b c d - disk
        l m r - peg
    )
    (:init
        ; Size relations: A < B < C < D
        (smaller a b) (smaller a c) (smaller a d)
        (smaller b c) (smaller b d)
        (smaller c d)
        
        ; Initial State: All disks on R (A top, D bottom)
        (on a b)
        (on b c)
        (on c d)
        (on-peg d r)
        
        ; Clear states
        (clear-d a)
        (clear-p l)
        (clear-p m)
        
        ; Location tracking
        (location a r)
        (location b r)
        (location c r)
        (location d r)
        
        ; Initial Cost
        (= (total-cost) 0)
    )
    (:goal (and
        (location a l)
        (location b l)
        (location c l)
        (location d l)
    ))
    (:metric minimize (total-cost))
)