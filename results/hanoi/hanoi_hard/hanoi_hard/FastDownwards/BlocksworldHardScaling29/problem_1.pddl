(define (problem hanoi-6-disks)
    (:domain tower-of-hanoi)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        ; --- Size relations (Invariants: A < B < C < D < E < F) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; --- Initial Stack configuration (Right Peg: A/B/C/D/E/F) ---
        ; Stack definition (top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)

        ; --- Clearance ---
        (clear A)
        
        ; --- Peg states ---
        (peg-clear L)
        (peg-clear M)
    )
    (:goal (and
        ; Target stack on Left Peg: A/B/C/D/E/F
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L)

        ; M and R must be empty
        (peg-clear M)
        (peg-clear R)
    ))
)