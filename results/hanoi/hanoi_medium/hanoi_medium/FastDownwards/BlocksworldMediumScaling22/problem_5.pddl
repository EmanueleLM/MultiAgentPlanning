(define (problem hanoi-5-to-left)
    (:domain hanoi-5-disks)
    (:objects
        A B C D E - disk ; A smallest, E largest
        L M R - peg    ; Left, Middle, Right
    )
    (:init
        ; Initial stack configuration: A on B on C on D on E on M (Middle peg)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E M)

        ; Status
        (clear A)
        (peg-clear L)
        (peg-clear R)
        
        ; Size constraints: (smaller D1 D2) means D1 is smaller than D2
        (smaller A B) (smaller A C) (smaller A D) (smaller A E)
        (smaller B C) (smaller B D) (smaller B E)
        (smaller C D) (smaller C E)
        (smaller D E)
    )
    (:goal (and
        ; Target stack configuration: A on B on C on D on E on L (Left peg)
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E L)
        
        ; Pegs M and R must be empty
        (peg-clear M)
        (peg-clear R)
        
        ; A must be clear
        (clear A)
    ))
)