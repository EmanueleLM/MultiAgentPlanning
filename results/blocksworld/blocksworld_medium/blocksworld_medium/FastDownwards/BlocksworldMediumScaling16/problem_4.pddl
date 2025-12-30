(define (problem hanoi-5-medium)
    (:domain hanoi-5-disks)
    
    (:init
        (= (total-cost) 0)

        ; Static: Smaller relationships (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial Configuration on peg_M: A/B/C/D/E (Top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E peg_M)

        ; Clearance
        (top-disk A)
        (clear-peg peg_L)
        (clear-peg peg_R)
        ; peg_M is implicitly not clear since E is on it and (clear-peg peg_M) is not asserted.
    )
    (:goal (and
        ; Final stack on peg_R: A/B/C/D/E
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E peg_R)

        ; Pegs L and M must be empty
        (clear-peg peg_L)
        (clear-peg peg_M)
    ))
    (:metric minimize (total-cost))