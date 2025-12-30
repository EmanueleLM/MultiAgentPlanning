(define (problem hanoi-5-disks-L-to-M)
    (:domain hanoi-5-disk)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    
    (:init
        ; --- Size Relations (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial Stack: A/B/C/D/E on L (Top to Bottom) ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)

        ; --- Clear status ---
        (clear A) ; A is on top
        (clear M) ; M is empty
        (clear R) ; R is empty
    )
    
    (:goal (and
        ; --- Final Stack: A/B/C/D/E on M ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E M)
        
        ; --- Pegs L and R must be empty ---
        (clear L)
        (clear R)
    ))
)