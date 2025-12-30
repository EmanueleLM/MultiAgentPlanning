(define (problem hanoi-4-disks-problem)
    (:domain hanoi-4-disks)
    (:objects
        A B C D - disk
        Left Middle Right - peg
    )
    
    (:init
        (= (total-cost) 0)

        (on D Left)
        (on C D)
        (on B C)
        (on A B)

        (clear A)
        (clear Middle)
        (clear Right)

        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
    )

    (:goal (and
        (on D Right)
        (on C D)
        (on B C)
        (on A B)
    ))

    (:metric minimize (total-cost))
)