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
        
        ; Configuration on Peg R (Initial stack: A/B/C/D/E/F/G)
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G)
        (on-peg G R)
        (top-disk A R)
        
        ; Location tracking: All disks start on R
        (disk-at A R) (disk-at B R) (disk-at C R) (disk-at D R) 
        (disk-at E R) (disk-at F R) (disk-at G R)
        
        ; Peg status
        (peg-empty L)
        (peg-empty M)
    )
    (:goal (and
        ; Target stack structure on Peg M
        (on A B) (on B C) (on C D) (on D E) (on E F) (on F G)
        (on-peg G M)
        
        ; Location goal: All disks end on M
        (disk-at A M) (disk-at B M) (disk-at C M) (disk-at D M) 
        (disk-at E M) (disk-at F M) (disk-at G M)
        
        ; Terminal conditions: L and R must be empty
        (peg-empty L)
        (peg-empty R)
    ))
)