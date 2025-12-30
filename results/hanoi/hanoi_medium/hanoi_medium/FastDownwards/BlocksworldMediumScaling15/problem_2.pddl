(define (problem hanoi-5-disk-R-to-M)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Static Size Relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial State: All disks on R (A top, E bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (is-bottom E R)
        
        ; Initial Clearance
        (clear A)
        
        ; Empty pegs
        (empty L)
        (empty M)
    )
    (:goal (and
        ; Goal State: All disks on M (A top, E bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (is-bottom E M)
        
        ; Other pegs must be empty
        (empty L)
        (empty R)
    ))
)