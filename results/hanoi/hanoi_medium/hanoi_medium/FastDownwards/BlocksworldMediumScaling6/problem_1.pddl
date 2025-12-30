(define (problem hanoi-5-left-to-right)
    (:domain hanoi-5disks)
    (:objects
        a b c d e - disk
        left middle right - peg
    )
    (:init
        ;; Size relations: A < B < C < D < E
        (smaller a b) (smaller a c) (smaller a d) (smaller a e)
        (smaller b c) (smaller b d) (smaller b e)
        (smaller c d) (smaller c e)
        (smaller d e)

        ;; Initial state: Stack A/B/C/D/E on LEFT peg
        (on a b)
        (on b c)
        (on c d)
        (on d e)
        (on-peg e left)

        (clear a)
        (empty middle)
        (empty right)
    )
    (:goal (and
        ;; Final stack A/B/C/D/E on RIGHT peg
        (on a b)
        (on b c)
        (on c d)
        (on d e)
        (on-peg e right)
        (clear a)
        
        ;; Left and Middle pegs must be empty
        (empty left)
        (empty middle)
    ))
)