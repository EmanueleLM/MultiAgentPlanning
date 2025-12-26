(define (problem hanoi-5-l-to-r)
    (:domain hanoi-5disks)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ; Static Disk Sizes (5 facts: A=1, B=2, C=3, D=4, E=5)
        (= (disk-size A) 1)
        (= (disk-size B) 2)
        (= (disk-size C) 3)
        (= (disk-size D) 4)
        (= (disk-size E) 5)

        ; Initial Stack Configuration on L (A top, E bottom)
        (on_peg E L)
        (on_disk D E)
        (on_disk C D)
        (on_disk B C)
        (on_disk A B)

        ; Top Disk Status
        (clear A)
        
        ; Empty Peg Status
        (peg_clear M)
        (peg_clear R)
        
        ; Disk Locations (All disks start at L)
        (at A L) (at B L) (at C L) (at D L) (at E L)
    )
    (:goal (and
        (on_peg E R)
        (on_disk D E)
        (on_disk C D)
        (on_disk B C)
        (on_disk A B)
        (peg_clear L)
        (peg_clear M)
        ; All disks must be located at R
        (at A R) (at B R) (at C R) (at D R) (at E R)
    ))

    (:metric minimize (total-cost))