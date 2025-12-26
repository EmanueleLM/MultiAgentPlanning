(define (problem hanoi-scaling-14)
    (:domain hanoi-7-disks)
    (:objects
        A B C D E F G - disk ; A smallest, G largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        (= (total-cost) 0)
        
        ; --- Static Size relations: LARGER D1 D2 means D1 > D2 ---
        (larger B A)
        
        (larger C A) (larger C B)
        
        (larger D A) (larger D B) (larger D C)
        
        (larger E A) (larger E B) (larger E C) (larger E D)
        
        (larger F A) (larger F B) (larger F C) (larger F D) (larger F E)
        
        (larger G A) (larger G B) (larger G C) (larger G D) (larger G E) (larger G F)
        
        ; --- Initial State: All on Middle peg (M) ---
        ; Stack order (top to bottom): A, B, C, D, E, F, G, M
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G M)
        
        ; --- Initial Clear status ---
        ; Disk A is clear (top disk). L and R pegs are clear.
        (clear A)
        (clear L)
        (clear R)
    )
    (:goal (and
        ; Goal State: All on Left peg (L)
        ; Stack order (top to bottom): A, B, C, D, E, F, G, L
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on G L)
    ))
    (:metric minimize (total-cost))
)