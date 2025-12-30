(define (problem Hanoi6_LMR)
    (:domain tower-of-hanoi-6-disks)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        ; --- Static Size Relations (d1 < d2) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; --- Initial Configuration: L holds A/B/C/D/E/F top to bottom ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L) ; F is on the base of the Left peg
        
        ; Clear state
        (clear A)
        
        ; Peg status
        (peg-empty M)
        (peg-empty R)

        ; Hand status
        (handempty)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; R must hold A/B/C/D/E/F top to bottom
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R) ; F is on the base of the Right peg
        
        ; L and M must be empty
        (peg-empty L)
        (peg-empty M)
    ))
    (:metric minimize (total-cost))
)