(define (problem hanoi-5-l-to-r)
    (:domain hanoi-5disks)
    (:objects
        A B C D E - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ; --- Static Size ordering (A < B < C < D < E) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; --- Initial Stack Configuration on L (A top, E bottom) ---
        (on_peg E L)
        (on_disk D E)
        (on_disk C D)
        (on_disk B C)
        (on_disk A B)

        ; --- Clear Status ---
        (clear A)
        ; B, C, D, E are covered (not clear)

        ; M and R are initially empty
        (peg_clear M)
        (peg_clear R)
        ; L is not clear (implied by (on_peg E L))
        
        ; --- Disk Locations ---
        (at A L) (at B L) (at C L) (at D L) (at E L)
        (not (at A M)) (not (at B M)) (not (at C M)) (not (at D M)) (not (at E M))
        (not (at A R)) (not (at B R)) (not (at C R)) (not (at D R)) (not (at E R))
    )
    (:goal (and
        (on_peg E R)
        (on_disk D E)
        (on_disk C D)
        (on_disk B C)
        (on_disk A B)
        (peg_clear L)
        (peg_clear M)
        ; Explicitly verify all disks are on R for robust goal checking
        (at A R) (at B R) (at C R) (at D R) (at E R)
    ))

    (:metric minimize (total-cost))
)