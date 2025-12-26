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

        ; Location tracking (Required by actions)
        (disk-at A M) (disk-at B M) (disk-at C M) (disk-at D M)

        ; Clearance
        (clear-disk A)
        
        ; Peg clearance (L and R are empty)
        (clear-peg L)
        (clear-peg R)
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal configuration: All disks stacked on Right (R)
        (base D R)
        (on C D)
        (on B C)
        (on A B)

        ; Location tracking
        (disk-at A R) (disk-at B R) (disk-at C R) (disk-at D R)

        ; Left and Middle pegs must be empty (Specification constraint)
        (clear-peg L)
        (clear-peg M)
    ))
    (:metric minimize (total-cost))
)