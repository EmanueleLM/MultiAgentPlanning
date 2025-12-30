(define (problem hanoi-6-disks-L-to-M)
    (:domain tower-of-hanoi)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        ;; Static smaller relations (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ;; Initial state: Stack F E D C B A on L peg (A is top, F is bottom)
        (on A B) 
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F L)

        ;; Clearance
        (clear A) ; Top disk
        (clear M) ; Empty peg
        (clear R) ; Empty peg
    )
    (:goal (and
        ;; Goal state: Stack F E D C B A on M peg
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F M)

        ;; Left and Right pegs must be empty
        (clear L)
        (clear R)
    ))
)