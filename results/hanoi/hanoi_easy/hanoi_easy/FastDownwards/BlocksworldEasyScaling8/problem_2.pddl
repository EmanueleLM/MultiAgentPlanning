(define (problem hanoi-4disk-p2-to-p3)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk
        P1 P2 P3 - peg
    )
    (:init
        ; Static Smaller relations: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: D, C, B, A stacked on P2.
        ; A on B, B on C, C on D, D on P2.
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-peg D P2)

        ; Clear States
        (clear-disk A)   ; A is the top disk
        (clear-peg P1)  ; Peg 1 is empty
        (clear-peg P3)  ; Peg 3 is empty
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal Configuration: D, C, B, A stacked on P3.
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-peg D P3)
        (clear-disk A)
        (clear-peg P1)
        (clear-peg P2)
    ))
    
    (:metric minimize (total-cost))
)