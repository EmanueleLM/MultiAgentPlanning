(define (problem hanoi_7_disks)
    (:domain hanoi_7disk)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ; Peg availability
        (available M)
        (available R)
        
        ; Initial Stack on L (A smallest/top, G largest/base)
        (clear A)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on-base G L)
        
        ; Location tracking
        (located A L) (located B L) (located C L) (located D L) 
        (located E L) (located F L) (located G L)
        
        ; Size relations (smallest-than)
        (smallest-than A B) (smallest-than A C) (smallest-than A D) (smallest-than A E) (smallest-than A F) (smallest-than A G)
        (smallest-than B C) (smallest-than B D) (smallest-than B E) (smallest-than B F) (smallest-than B G)
        (smallest-than C D) (smallest-than C E) (smallest-than C F) (smallest-than C G)
        (smallest-than D E) (smallest-than D F) (smallest-than D G)
        (smallest-than E F) (smallest-than E G)
        (smallest-than F G)
    )
    (:goal (and
        ; All disks located on R
        (located A R) (located B R) (located C R) (located D R) 
        (located E R) (located F R) (located G R)
        
        ; Correct final stack order
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (clear A)
        (on-base G R)
    ))
    (:metric minimize (total-cost))
)