(define (problem BlocksworldEasyScaling14)
    (:domain hanoi-4disk)
    (:objects
        a b c d - disk ; A is smallest, D is largest
        l m r - peg    ; Left, Middle, Right
    )
    (:init
        (= (total-cost) 0)
        
        ; Size relations: A < B < C < D
        (smaller a b) (smaller a c) (smaller a d)
        (smaller b c) (smaller b d)
        (smaller c d)

        ; Initial State: Middle (M) holds [A, B, C, D] (A top, D bottom)
        (on a b)
        (on b c)
        (on c d)
        (on d m) ; D is on peg M

        ; Clear elements: A is the top disk, L and R are empty pegs.
        (clear a)
        (clear l)
        (clear r)
    )
    (:goal (and
        ; Goal State: Left (L) holds [A, B, C, D] (A top, D bottom)
        (on a b)
        (on b c)
        (on c d)
        (on d l)
    ))
    (:metric minimize (total-cost))
)