(define (problem hanoi-6-m-to-r)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)

        ;; Size definitions (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ;; Initial State: All disks stacked on M (A on top of B... F on M)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)

        ;; Top disk is clear
        (clear A)

        ;; Initial peg states
        (not (is-empty M))
        (is-empty L)
        (is-empty R)
    )
    (:goal (and
        ;; Final State: All disks stacked on R (A on top of B... F on R)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F R)
        
        ;; Ensure other pegs are empty
        (is-empty L)
        (is-empty M)
    ))
    (:metric minimize (total-cost))
)