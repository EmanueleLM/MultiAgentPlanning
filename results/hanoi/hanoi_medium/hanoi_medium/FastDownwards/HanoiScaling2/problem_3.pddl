(define (problem hanoi-5-disks)
    (:domain HANOI-5)
    (:objects
        A B C D E - disk ; A is smallest, E is largest
        L M R - peg      ; Left, Middle, Right
    )
    (:init
        ; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Stack configuration on Left (L): A on B on C on D on E
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-peg E L)

        ; Clarity: A is clear
        (clear A)
        
        ; Peg status
        (peg-clear M)
        (peg-clear R)

        ; Location tracking (All disks start on L)
        (at A L) (at B L) (at C L) (at D L) (at E L)
    )
    (:goal (and
        ; Goal: All disks must be located on peg R
        (at A R)
        (at B R)
        (at C R)
        (at D R)
        (at E R)
    ))
)