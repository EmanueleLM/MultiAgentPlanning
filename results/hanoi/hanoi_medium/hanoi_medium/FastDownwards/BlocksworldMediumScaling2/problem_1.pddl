(define (problem HANOI-5-DISK-L-TO-R)
    (:domain TOWER-OF-HANOI)
    (:objects
        A B C D E - disk ; Smallest A, Largest E
        L M R - peg      ; Left, Middle, Right
    )
    
    (:init
        ; --- Static size relations (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial Configuration: L holds A, B, C, D, E (top to bottom) ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L) 

        ; Clear status
        (clear A) ; A is on top
        (clear M) ; M is empty
        (clear R) ; R is empty
        
        ; Implicitly: B, C, D, E, L are not clear
    )

    (:goal (and
        ; Final Configuration: R holds A, B, C, D, E (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R)
        
        ; Pegs L and M must be empty
        (clear L)
        (clear M)
    ))
)