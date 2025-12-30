(define (problem hanoi-6disk-middle-to-right)
    (:domain hanoi-6disk)
    (:objects
        A B C D E F - disk
        LEFT MIDDLE RIGHT - peg
    )
    (:init
        ; Size constraints (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Location (Stack A-F on MIDDLE)
        (on-d A B)
        (on-d B C)
        (on-d C D)
        (on-d D E)
        (on-d E F)
        (on-p F MIDDLE)

        ; Clearance
        (clear-d A) 
        (clear-p LEFT)
        (clear-p RIGHT)
    )

    (:goal (and
        ; Target location: Stack A-F on RIGHT
        (on-d A B)
        (on-d B C)
        (on-d C D)
        (on-d D E)
        (on-d E F)
        (on-p F RIGHT)
        
        ; A must be on top
        (clear-d A) 
        
        ; MIDDLE peg must be empty
        (clear-p MIDDLE)
        (clear-p LEFT)
    ))
)