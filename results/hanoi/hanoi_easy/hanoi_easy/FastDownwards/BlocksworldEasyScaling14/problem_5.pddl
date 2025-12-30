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
        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-peg d m) 

        ; Clear elements: A is the top disk, L and R are empty pegs.
        (clear-disk a)
        (clear-peg l)
        (clear-peg r)
    )
    (:goal (and
        ; Goal State: Left (L) holds [A, B, C, D] (A top, D bottom)
        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-peg d l)
        
        ; Middle and Right pegs must be empty (clear)
        (clear-peg m)
        (clear-peg r)
        
        ; Top disk must be clear
        (clear-disk a)
    ))
    (:metric minimize (total-cost))