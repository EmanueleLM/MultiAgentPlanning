(define (problem hanoi-4d)
    (:domain tower-of-hanoi-4d)
    (:objects
        A B C D - disk ; A smallest, D largest
        L M R - peg    ; Left, Middle, Right
    )
    (:init
        ; Size definitions (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial Stack on L: A on B, B on C, C on D, D on L base
        (on A B)
        (on B C)
        (on C D)
        (on-peg D L)

        ; A is the top disk and is clear
        (clear A)

        ; Peg status: M and R are empty
        (peg-clear M)
        (peg-clear R)
    )
    (:goal (and
        ; Final Stack on R: A on B, B on C, C on D, D on R base
        (on A B)
        (on B C)
        (on C D)
        (on-peg D R)

        ; L and M must be empty
        (peg-clear L)
        (peg-clear M)
    ))
)