(define (problem Hanoi-5-Disks)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ;; Disk sizes: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ;; Initial Stack on R: A (top) -> E (bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E R)
        
        (clear A)
        (peg-empty L)
        (peg-empty M)
    )
    (:goal (and
        ;; Goal Stack on M: A (top) -> E (bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E M)
        
        (clear A)
        (peg-empty L)
        (peg-empty R)
    ))
)