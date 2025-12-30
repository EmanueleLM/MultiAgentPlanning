(define (problem hanoi-4-disks-problem)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk  ; A smallest, D largest
        L M R - peg     ; Left, Middle, Right
    )

    (:init
        ; Static Sizes (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial State: Middle Peg (M) holds D, C, B, A (top)
        (on D M)
        (on C D)
        (on B C)
        (on A B)

        ; Initial Clear status (A is top disk, L and R are empty pegs)
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

        ; L and M must be empty (M is uncleared because D is on it initially, but 
        ; must be clear in the goal state)
        (clear L)
        (clear M)
    ))
)