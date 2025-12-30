(define (problem hanoi-7-L-R)
    (:domain hanoi-7-disks)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )

    (:init
        (= (total-cost) 0)

        ; Size Hierarchy Definition (A < B < C < D < E < F < G)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; Initial Configuration: Stack L (A top, G bottom)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-disk E F)
        (on-disk F G)
        
        ; Base disk G rests on Peg L
        (on-peg G L)

        ; Clearance
        (clear A)
        
        ; Peg availability (L is unavailable)
        (available M)
        (available R)
    )

    (:goal (and
        ; Final Configuration: Stack R (A top, G bottom)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-disk E F)
        (on-disk F G)

        (on-peg G R)
        
        ; L and M must be empty/available
        (available L)
        (available M)
    ))

    (:metric minimize (total-cost))