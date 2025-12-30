(define (problem hanoi-4-disk-p2-to-p3)
    (:domain hanoi-4-disk)
    
    (:objects
        A B C D - disk
        P1 P2 P3 - peg
    )
    
    (:init
        ; Size constraints: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: All disks stacked on P2 (Middle)
        ; D rests on P2, C on D, B on C, A on B (Bottom to Top)
        (on D P2)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance:
        (clear A)  ; A is the top disk
        (clear P1) ; Left peg is empty
        (clear P3) ; Right peg is empty
        
        ; D, C, B, and P2 are NOT clear initially.
    )
    
    (:goal (and
        ; Target Configuration: All disks stacked on P3 (Right)
        (on D P3)
        (on C D)
        (on B C)
        (on A B)
        
        ; Pegs P1 and P2 must be empty
        (clear P1)
        (clear P2)
    ))
)