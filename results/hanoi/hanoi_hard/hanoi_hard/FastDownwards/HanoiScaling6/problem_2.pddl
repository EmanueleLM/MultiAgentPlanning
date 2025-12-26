(define (problem hanoi-6-disks)
    (:domain hanoi-6)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        (= (total-cost) 0)
        
        ;; Size relations: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ;; Initial Stack configuration on L (A on top)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-disk E F)
        (on-peg F L)

        ;; Initial Clearance
        (clear A)
        (peg-clear M)
        (peg-clear R)
    )
    (:goal (and
        ;; Goal Stack configuration on R (A on top)
        (on-disk A B)
        (on-disk B C)
        (on-disk C D)
        (on-disk D E)
        (on-disk E F)
        (on-peg F R)
        
        ;; Other pegs must be empty
        (peg-clear L)
        (peg-clear M)
    ))
    (:metric minimize (total-cost))
)