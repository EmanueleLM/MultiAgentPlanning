(define (problem hanoi6-r)
    (:domain hanoi6)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    (:init
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F M)

        (clear L)
        (clear R)
        (clear A)
        
        (= (total-cost) 0)
    )
    (:goal (and
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F R)
    ))
    (:metric minimize (total-cost))
)