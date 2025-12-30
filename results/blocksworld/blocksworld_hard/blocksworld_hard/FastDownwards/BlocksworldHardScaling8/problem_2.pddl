(define (problem hanoi6-r)
    (:domain hanoi6)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ; Disks are ordered A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial State: All disks on Middle peg (M), F (base) to A (top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F M)

        ; Clearance: Pegs L and R are clear. Disk A is clear.
        (clear L)
        (clear R)
        (clear A)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: All disks on Right peg (R), F (base) to A (top)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F R)
    ))
    (:metric minimize (total-cost))
)