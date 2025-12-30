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

        ; Initial Clear status
        (clear A) ; A is on top
        (clear L) ; Left peg is empty
        (clear R) ; Right peg is empty
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
)