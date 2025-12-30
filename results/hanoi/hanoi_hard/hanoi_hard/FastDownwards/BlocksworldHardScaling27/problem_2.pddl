(define (problem Hanoi6DiskProblem)
    (:domain Hanoi)
    (:objects
        A B C D E F - disk
        R M L - peg
    )
    (:init
        ; Static smaller facts (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial State: A/B/C/D/E/F on R (A is top)
        (on_disk A B)
        (on_disk B C)
        (on_disk C D)
        (on_disk D E)
        (on_disk E F)
        (on_peg F R)
        
        ; Clearance state
        (clear A)
        (peg_empty M)
        (peg_empty L)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal State: A/B/C/D/E/F on L. R and M must be empty.
        (on_disk A B)
        (on_disk B C)
        (on_disk C D)
        (on_disk D E)
        (on_disk E F)
        (on_peg F L)
        (peg_empty R)
        (peg_empty M)
    ))
    (:metric minimize (total-cost))
)