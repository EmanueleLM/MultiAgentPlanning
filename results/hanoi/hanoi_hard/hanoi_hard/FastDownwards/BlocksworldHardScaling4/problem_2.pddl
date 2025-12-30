(define (problem hanoi-6-p01)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk ; A is smallest, F is largest
        L M R - peg        ; Left, Middle, Right pegs
    )
    (:init
        ; Size constraints: A < B < C < D < E < F
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)

        ; Initial stack on Left peg (L): A/B/C/D/E/F
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F L)

        ; Clearance: only the top disk A is clear
        (clear A)
        
        ; Peg states: M and R are empty
        (peg-clear M)
        (peg-clear R)
        
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal stack on Middle peg (M): A/B/C/D/E/F
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on-peg F M)

        ; L and R must be empty
        (peg-clear L)
        (peg-clear R)
    ))
    (:metric minimize (total-cost))