(define (problem Hanoi-6-Disks)
    (:domain hanoi)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        R M L - peg        ; Right, Middle, Left
    )
    (:init
        (= (total-cost) 0)

        ;; Static size relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ;; Initial stack: R holds A/B/C/D/E/F (A on top, F on R)
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on_peg F R)
        
        ;; Initial status
        (clear A)
        (peg_empty M)
        (peg_empty L)
    )
    (:goal (and
        ;; Goal stack: L holds A/B/C/D/E/F
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on_peg F L)
        
        ;; R and M must be empty
        (peg_empty R)
        (peg_empty M)
    ))
    (:metric minimize (total-cost))
)