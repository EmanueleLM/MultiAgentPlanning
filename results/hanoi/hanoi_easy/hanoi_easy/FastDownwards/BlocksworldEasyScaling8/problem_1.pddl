(define (problem hanoi-4disk-p2-to-p3)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk  ; A smallest, D largest
        P1 P2 P3 - peg
    )
    (:init
        ; Static Smaller relations: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: D, C, B, A stacked on P2.
        ; A is on B, B is on C, C is on D, D is on P2.
        (on A B)
        (on B C)
        (on C D)
        (on D P2)

        ; Clear States
        (clear A)   ; A is the top disk
        (clear P1)  ; Peg 1 is empty
        (clear P3)  ; Peg 3 is empty
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal Configuration: D, C, B, A stacked on P3.
        (on A B)
        (on B C)
        (on C D)
        (on D P3)
    ))
    
    (:metric minimize (total-cost))
)