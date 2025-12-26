(define (problem hanoi-7-disks-R-to-M)
    (:domain hanoi-7-disks)
    (:objects
        A B C D E F G - disk
        L M R - peg
    )
    (:init
        ; Size ordering (Static)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)
        
        ; Configuration on Peg R (Initial stack: A/B/C/D/E/F/G, A is top, G is bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        
        (on-peg G R)
        
        ; Top disk status
        (top-disk A R)
        
        ; Peg status
        (peg-empty L)
        (peg-empty M)
    )
    (:goal (and
        ; Target stack on Peg M (Goal stack: A/B/C/D/E/F/G, A is top, G is bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        
        (on-peg G M)
        
        ; Terminal conditions: L and R must be empty
        (peg-empty L)
        (peg-empty R)
    ))
)