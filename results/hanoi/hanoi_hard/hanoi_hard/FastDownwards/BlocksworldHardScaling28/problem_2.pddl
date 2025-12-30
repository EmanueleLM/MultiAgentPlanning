(define (problem BW-HardScaling28-Instance)
    (:domain BlocksworldHardScaling28)
    (:objects
        a b c d e f - disk
        l m r - peg
    )
    (:init
        ; Size relations: A < B < C < D < E < F
        (larger B A) (larger C A) (larger D A) (larger E A) (larger F A)
        (larger C B) (larger D B) (larger E B) (larger F B)
        (larger D C) (larger E C) (larger F C)
        (larger E D) (larger F D)
        (larger F E)

        ; Initial state: Right peg (R) holds A, B, C, D, E, F (top to bottom)
        ; Stack order (bottom up): F, E, D, C, B, A
        (on-peg F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance and Empty pegs
        (clear A)
        (empty L)
        (empty M)
    )
    (:goal (and
        ; Goal state: Middle peg (M) holds A, B, C, D, E, F (top to bottom)
        ; Stack order (bottom up): F, E, D, C, B, A
        (on-peg F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Left (L) and Right (R) pegs must be empty
        (empty L)
        (empty R)
    ))
)