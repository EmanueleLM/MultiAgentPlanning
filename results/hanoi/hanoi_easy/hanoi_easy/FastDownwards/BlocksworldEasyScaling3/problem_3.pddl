(define (problem hanoi-4d)
    (:domain tower-of-hanoi-4d)
    (:objects
        A B C D - disk ; A smallest, D largest
        L M R - peg    ; Left, Middle, Right
    )
    (:init
        ; Size definitions (A < B < C < D) - Static
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Stack on L (Top to Bottom: A, B, C, D)
        (on A B)
        (on B C)
        (on C D)
        (on-peg D L)

        ; Status
        (clear A)
        (peg-clear M)
        (peg-clear R)
    )
    (:goal (and
        ; Final Stack on R (Top to Bottom: A, B, C, D)
        (on A B)
        (on B C)
        (on C D)
        (on-peg D R)

        ; Auxiliary pegs must be empty
        (peg-clear L)
        (peg-clear M)
    ))
)