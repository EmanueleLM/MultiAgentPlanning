(define (problem BlocksworldMediumScaling17)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        ; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
        
        ; Initial stack on Right peg (R): A on B, B on C, C on D, D on E, E on R
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E R)
        
        ; Clear elements (A is top disk, L and M are empty pegs)
        (clear A)
        (clear L)
        (clear M)
        
        ; Status of R (Peg) and B, C, D, E (Disks) is not clear due to being stacked upon
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target stack on Middle peg (M)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E M)
    ))
    (:metric minimize (total-cost))
)