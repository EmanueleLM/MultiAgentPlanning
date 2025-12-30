(define (problem Hanoi5toM)
    (:domain hanoi-5disks)
    (:objects
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    (:init
        ; Static smaller relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial State: A, B, C, D, E on L (Top to bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)
        
        ; Clearance
        (is-clear A) ; A is on top
        (is-clear M) ; Middle peg is empty
        (is-clear R) ; Right peg is empty
        
        ; Objects that are not clear: B, C, D, E, L
    )
    (:goal (and
        ; Goal State: A, B, C, D, E on M
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E M)
        
        ; Final clearance requirements
        (is-clear L) ; Left peg empty
        (is-clear R) ; Right peg empty (Intermediate parking spot must end up clear)
    ))
)