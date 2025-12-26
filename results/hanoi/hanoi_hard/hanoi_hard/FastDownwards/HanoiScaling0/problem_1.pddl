(define (problem hanoi-4-disks-m_to_r)
    (:domain tower-of-hanoi)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        ; Static size relations (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Configuration: All disks stacked on Middle (M). A (smallest) on top, D (largest) base.
        (base D M)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance
        (clear-disk A) ; A is available
        
        ; Peg clearance
        (clear-peg L)  ; Left is empty
        (clear-peg R)  ; Right is empty
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal configuration: All disks stacked on Right (R)
        (base D R)
        (on C D)
        (on B C)
        (on A B)
    ))
    (:metric minimize (total-cost))
)