(define (problem hanoi-4disk-p)
    (:domain hanoi-4disk)
    (:objects
        a b c d - disk ; A=smallest, D=largest
        l m r - peg    ; L=Left, M=Middle, R=Right (Initial location)
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
        (clear-d a) ; Only A is clear
        ; (clear-d b), (clear-d c), (clear-d d) are false by CWA
        
        (clear-p l)
        (clear-p m)
        ; (clear-p r) is false by CWA (D is on R)
        
        ; Location tracking
        (location a r)
        (location b r)
        (location c r)
        (location d r)
        
        ; Initial Cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stacking on L
        (location a l)
        (location b l)
        (location c l)
        (location d l)
        
        ; Auxiliary pegs must be empty (Explicit requirement)
        (clear-p r)
        (clear-p m)
    ))
    (:metric minimize (total-cost))