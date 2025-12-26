(define (problem hanoi-4-m-to-r)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        ; Size hierarchy: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
        
        ; Initial stack configuration: A on B, B on C, C on D, D on M (Middle peg)
        (on A B)
        (on B C)
        (on C D)
        (on-peg D M)
        
        ; Initial clear status
        (clear A) ; A is on top
        (clear L) ; Left peg is empty
        (clear R) ; Right peg is empty
    )
    (:goal (and
        ; Goal stack configuration on R peg
        (on A B)
        (on B C)
        (on C D)
        (on-peg D R)
        (clear A) ; A must be the top disk
        
        ; Auxiliary pegs must be clear
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)