(define (problem hanoi-4disk-M-to-R)
    (:domain hanoi-4disk)
    (:objects
        A B C D - disk
        L M R - peg
    )
    (:init
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D) 

        ; Disks stacked A/B/C/D on M
        (on A B)
        (on B C)
        (on C D)
        (on D M)

        ; Top disk A is clear, Pegs L and R are clear
        (clear A)
        (clear L)
        (clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Disks stacked A/B/C/D on R
        (on A B)
        (on B C)
        (on C D)
        (on D R)
        
        ; Pegs L and M must be empty
        (clear L)
        (clear M)
        
        ; Top disk A must be clear
        (clear A)
    ))
    
    (:metric minimize (total-cost))
)