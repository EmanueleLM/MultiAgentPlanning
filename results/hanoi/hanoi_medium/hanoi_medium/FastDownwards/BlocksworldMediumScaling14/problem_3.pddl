(define (problem hanoi-5-m-to-l)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk
        Left Middle Right - peg
    )
    (:init
        (= (total-cost) 0)

        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)

        (on-peg E Middle)
        (on D E)
        (on C D)
        (on B C)
        (on A B)

        (clear A)
        (base-clear Left)
        (base-clear Right)
    )
    (:goal (and
        (on-peg E Left)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        (base-clear Middle)
        (base-clear Right)
    ))
    (:metric minimize (total-cost))