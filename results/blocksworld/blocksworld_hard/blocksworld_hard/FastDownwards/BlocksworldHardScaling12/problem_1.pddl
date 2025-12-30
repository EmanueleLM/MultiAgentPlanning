(define (problem hanoi-6-instance)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ; Size constraints (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Configuration: Stack on R (F bottom, A top)
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on-peg F R)

        ; Top disk status
        (top-disk R A)

        ; Empty pegs
        (empty L)
        (empty M)
    )
    (:goal (and
        ; Target configuration: Stack on L (F bottom, A top)
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on-peg F L)
        
        (top-disk L A)
        
        ; R and M must be empty
        (empty R)
        (empty M)
    ))
)