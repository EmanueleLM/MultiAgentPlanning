(define (problem hanoi-scaling-10)
    (:domain hanoi-6disks)
    (:objects
        A B C D E F - disk
        Left Middle Right - peg
    )
    (:init
        ; Initial Costs
        (= (total-cost) 0)

        ; --- Static Size Relations (A < B < C < D < E < F) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; --- Initial Stack: Middle Peg ---
        ; Stack definition (A top, F bottom)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F Middle)

        ; --- Clear Status ---
        ; A is the top disk. Left and Right pegs are clear (empty).
        (clear A)
        (clear Left)
        (clear Right)
    )
    (:goal (and
        ; Goal State: Stack A-F on Right Peg
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F Right)
    ))
    (:metric minimize (total-cost))
)