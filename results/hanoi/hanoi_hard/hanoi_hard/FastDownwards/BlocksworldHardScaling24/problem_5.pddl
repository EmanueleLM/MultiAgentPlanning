(define (problem hanoi-6disks-M-to-R)
    (:domain hanoi-6disks)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right
    )
    
    (:init
        ;; Static Size relations: A < B < C < D < E < F
        (is-smaller A B) (is-smaller A C) (is-smaller A D) (is-smaller A E) (is-smaller A F)
        (is-smaller B C) (is-smaller B D) (is-smaller B E) (is-smaller B F)
        (is-smaller C D) (is-smaller C E) (is-smaller C F)
        (is-smaller D E) (is-smaller D F)
        (is-smaller E F)

        ;; Initial Configuration: All disks stacked on M (F bottom, A top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)

        ;; Disk Clearance: Only A is clear initially
        (clear A)

        ;; Peg Emptiness: L and R are empty
        (empty L)
        (empty R)
    )
    
    (:goal (and
        ;; Goal: All disks stacked on R (F bottom, A top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)
        
        ;; Ensure intermediate pegs are empty
        (empty L)
        (empty M)
    ))
)