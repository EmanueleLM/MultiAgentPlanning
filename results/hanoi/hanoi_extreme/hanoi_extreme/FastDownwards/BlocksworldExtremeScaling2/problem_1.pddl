(define (problem hanoi-7-to-r)
    (:domain hanoi-7-disk)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ;; Initial Stacking on Left Peg (L): A (smallest, top) down to G (largest, bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on-peg G L)
        
        ;; Clearance
        (clear A)
        
        ;; Peg status
        (peg-free M)
        (peg-free R)
        
        ;; Static Size Definitions (d1 < d2)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
    )
    (:goal (and
        ;; Target Stacking on Right Peg (R)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on-peg G R)
        ;; Final Peg Status
        (peg-free L)
        (peg-free M)
        (clear A)
    ))
    (:metric minimize (total-cost))
)