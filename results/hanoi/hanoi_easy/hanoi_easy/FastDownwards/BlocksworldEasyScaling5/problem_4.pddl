(define (problem hanoi-4disks-RtoL)
    (:domain hanoi_4disks)
    (:objects
        A B C D - disk ; A is smallest, D is largest
        Left Middle Right - peg
    )
    (:init
        ; Size relations (static)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; Initial placement: Stack D, C, B, A on Right peg (A is top)
        (on D Right)
        (on C D)
        (on B C)
        (on A B)

        ; Initial clarity: Only A, Left, and Middle are clear
        (clear A)
        (clear Left)
        (clear Middle)

        ; Cost initialization
        (= (total-cost) 0)
    )

    (:goal (and
        ; Final stack D, C, B, A on Left peg
        (on D Left)
        (on C D)
        (on B C)
        (on A B)
        
        ; Right and Middle pegs must be empty
        (clear Right)
        (clear Middle)
    ))

    (:metric minimize (total-cost))
)