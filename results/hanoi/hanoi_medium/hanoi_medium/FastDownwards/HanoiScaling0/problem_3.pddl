(define (problem hanoi-4disks-m2r)
    (:domain hanoi-4disks)
    (:objects
        A B C D - disk
        Left Middle Right - peg
    )
    
    (:init
        ; Size hierarchy: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial stack on Middle peg: [A, B, C, D] top to bottom
        ; A (smallest, top disk)
        (on A B)
        (at A Middle)
        (clear A)

        ; B
        (on B C)
        (at B Middle)

        ; C
        (on C D)
        (at C Middle)

        ; D (largest, bottom disk)
        (is_bottom D Middle)
        (at D Middle)

        ; Peg states
        (empty Left)
        (empty Right)

        ; Initial cost
        (= (total-cost) 0)
    )

    (:goal (and
        ; Final stack [A, B, C, D] must be on Right peg
        (at A Right)
        (at B Right)
        (at C Right)
        (at D Right)

        (on A B)
        (on B C)
        (on C D)
        (is_bottom D Right)

        ; Ensuring all other pegs are empty
        (empty Left)
        (empty Middle)
    ))
    
    (:metric minimize (total-cost))
)