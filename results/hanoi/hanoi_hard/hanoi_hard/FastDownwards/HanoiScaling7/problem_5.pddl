(define (problem hanoi-6disk-p2-to-p3-instance)
    (:domain hanoi-6disk)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        P1 P2 P3 - peg     ; P1=Left, P2=Middle, P3=Right
    )
    (:init
        ; Size Relations (Static: A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial Stack on P2 (Middle: A top, F bottom)
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (base-of F P2)

        ; Location initialization
        (loc A P2) (loc B P2) (loc C P2) (loc D P2) (loc E P2) (loc F P2)

        ; Clearance and Emptiness
        (clear A)
        (peg-empty P1) ; Left Peg
        (peg-empty P3) ; Right Peg
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Target Stack: All disks on P3 (F bottom, A top)
        (base-of F P3)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        (clear A) ; A must be the top disk

        ; All disks must be located at P3
        (loc A P3) (loc B P3) (loc C P3) (loc D P3) (loc E P3) (loc F P3)
        
        ; P1 and P2 must be empty
        (peg-empty P1)
        (peg-empty P2)
    ))
    (:metric minimize (total-cost))
)