(define (problem hanoi-6disk-M-to-R)
    (:domain hanoi-6disk)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    
    (:init
        ; Static Size relations (A smallest, F largest)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial setup on Middle (M) peg: F bottom, A top
        (at A M) (at B M) (at C M) (at D M) (at E M) (at F M)
        
        ; Stacking structure: A on B, B on C, ..., E on F
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)

        (top A) 
        
        (is-base F M) ; F is the base disk on M

        ; Peg status
        (clear L)
        (clear R)
        ; M is occupied implicitly by CWA

        (= (total-cost) 0)
    )

    (:goal (and
        ; All disks must be located on the Right peg (R)
        (at A R) (at B R) (at C R) (at D R) (at E R) (at F R)
        
        ; Final stack structure on R
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (is-base F R)
        (top A)

        ; Auxiliary pegs must be empty
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))