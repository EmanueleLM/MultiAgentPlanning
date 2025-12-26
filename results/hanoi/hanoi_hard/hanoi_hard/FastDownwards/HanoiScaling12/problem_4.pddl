(define (problem hanoi-6disk-r-to-l)
    (:domain hanoi-6disk)
    (:objects
        a b c d e f - disk
        L M R - peg ; Left, Middle, Right
    )
    (:init
        ;; Size relations: A < B < C < D < E < F
        (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
        (smaller b c) (smaller b d) (smaller b e) (smaller b f)
        (smaller c d) (smaller c e) (smaller c f)
        (smaller d e) (smaller d f)
        (smaller e f)

        ;; Initial stack on Right peg (R): F bottom up to A top
        (at-peg f R)
        (on e f) (on d e) (on c d) (on b c) (on a b)

        ;; Clarity status
        (clear a)
        
        ;; Peg status (R is occupied, L and M are empty)
        (empty L)
        (empty M)
    )
    (:goal (and
        ;; Final stack on Left peg (L): F bottom up to A top
        (at-peg f L)
        (on e f) (on d e) (on c d) (on b c) (on a b)
        
        (clear a)

        ;; Other pegs must be empty
        (empty R)
        (empty M)
    ))
)