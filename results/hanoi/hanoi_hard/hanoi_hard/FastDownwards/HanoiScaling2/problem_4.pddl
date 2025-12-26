(define (problem hanoi-5disk-problem)
    (:domain hanoi-5disk)
    (:objects
        A B C D E - disk ; A smallest, E largest
        L M R - peg      ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)

        ; Static smaller facts (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial State: All disks stacked on L (A on top of B... E on L)
        (on E L)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Initial Clear Status
        (clear A) ; A is on top
        (clear M) ; Middle peg is empty
        (clear R) ; Right peg is empty
    )
    
    (:goal (and
        ; Target state: All disks stacked on R (E at base, A at top)
        (on E R)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
    ))
    
    (:metric minimize (total-cost))
)