(define (problem blocksworld-hanoi-4)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk
        P1 P2 P3 - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ; 1. Define static size relations (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
        
        ; 2. Initial Stack on P2: D bottom, A top
        ; P2 stack configuration: D on P2, C on D, B on C, A on B
        (on D P2)
        (on C D)
        (on B C)
        (on A B)
        
        ; 3. Clear status
        ; A is clear (top disk)
        (clear A)
        ; P1 and P3 are clear (empty pegs)
        (clear P1)
        (clear P3)
    )
    
    (:goal (and
        ; Goal: D, C, B, A stacked on P3
        (on D P3)
        (on C D)
        (on B C)
        (on A B)
    ))
    
    (:metric minimize (total-cost))
)