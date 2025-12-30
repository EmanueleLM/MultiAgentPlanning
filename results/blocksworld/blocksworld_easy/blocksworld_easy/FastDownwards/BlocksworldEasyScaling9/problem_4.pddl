(define (problem hanoi-4-disks-problem)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        L M R - peg
    )

    (:init
        (= (total-cost) 0)
        
        ; Static Sizes (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial State: Middle Peg (M) holds D, C, B, A (top)
        (on D M)
        (on C D)
        (on B C)
        (on A B)

        ; Initial Clear status
        (clear A)
        (clear L)
        (clear R)
    )

    (:goal (and
        ; Goal Stack on Right (R): D, C, B, A (top)
        (on D R)
        (on C D)
        (on B C)
        (on A B)

        ; L and M must be empty
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)