(define (problem BlocksworldMediumScaling28)
    (:domain tower-of-hanoi-5disk)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    (:init
        ; Size relations: A < B < C < D < E
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial State: Right peg holds [A, B, C, D, E] top to bottom
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Right)

        ; A is the top disk, Left and Middle pegs are empty
        (clear-disk A)
        (clear-peg Left)
        (clear-peg Middle)
    )
    (:goal (and
        ; Middle peg holds [A, B, C, D, E] top to bottom
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on-peg E Middle)
        (clear-disk A)

        ; Left and Right pegs must be empty
        (clear-peg Left)
        (clear-peg Right)
    ))
)