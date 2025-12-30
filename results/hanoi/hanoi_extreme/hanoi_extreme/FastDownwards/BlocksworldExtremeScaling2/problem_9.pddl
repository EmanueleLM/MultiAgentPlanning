(define (problem hanoi-7-disk)
    (:domain tower_of_hanoi)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ;; Peg Status
        (peg-empty M)
        (peg-empty R)
        
        ;; Initial Stack on L: A top, G bottom
        (base G L)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ;; Clearance
        (clear A)
        
        ;; Size Relations: A < B < C < D < E < F < G
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
    )
    (:goal (and
        ;; Stack must be on R: A top, G bottom
        (base G R)
        (on F G)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ;; Pegs L and M must be empty
        (peg-empty L)
        (peg-empty M)
    ))
    (:metric minimize (total-cost))