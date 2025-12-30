(define (problem BlocksworldMediumScaling13)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        R M L - peg
    )
    (:init
        ;; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ;; Initial stack on R (Right peg): A (top) -> B -> C -> D -> E (bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E R)

        (is-top A)
        
        ;; Peg status
        (empty L)
        (empty M)
    )
    (:goal (and
        ;; Final configuration on M (Middle peg): A->B->C->D->E
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E M)
        
        ;; A must be on top
        (is-top A) 
        
        ;; Other pegs must be empty
        (empty R)
        (empty L)
    ))
)