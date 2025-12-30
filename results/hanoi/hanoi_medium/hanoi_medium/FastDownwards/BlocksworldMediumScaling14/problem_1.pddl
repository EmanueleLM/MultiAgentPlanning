(define (problem hanoi-5-m-to-l)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    (:init
        (= (total-cost) 0)

        ; Size relations (A < B < C < D < E)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        ; Initial Stack: Middle Peg (E bottom to A top)
        (on-peg E Middle)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        ; Clearance
        (clear A)
        (base-clear Left)
        (base-clear Right)
    )
    (:goal (and
        ; Goal Stack: Left Peg (E bottom to A top)
        (on-peg E Left)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Middle and Right pegs must be clear
        (base-clear Middle)
        (base-clear Right)
    ))
    (:metric minimize (total-cost))
)