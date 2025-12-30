(define (problem hanoi-4-disk-p2-to-p3)
    (:domain hanoi-4-disk)
    
    (:objects
        A B C D - disk
        P1 P2 P3 - peg
    )
    
    (:init
        (= (total-cost) 0)

        ; Size constraints: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: P2 -> D -> C -> B -> A (Bottom to Top)
        (on D P2)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance:
        (clear A)
        (clear P1)
        (clear P3)
    )
    
    (:goal (and
        ; Target Configuration: P3 -> D -> C -> B -> A
        (on D P3)
        (on C D)
        (on B C)
        (on A B)
        
        ; Pegs P1 and P2 must be empty
        (clear P1)
        (clear P2)
    ))

    (:metric minimize (total-cost))
)