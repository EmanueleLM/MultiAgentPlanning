(define (problem hanoi-4-disks)
    (:domain tower-of-hanoi)
    (:objects
        A B C D - disk  ; A smallest, D largest
        L M R - peg     ; Left, Middle, Right
    )
    (:init
        ; --- Size relations (Static) ---
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)

        ; --- Initial State (All disks on L: D bottom, A top) ---
        ; D is on L (Base)
        (on D L) 
        ; C on D, B on C, A on B (Stacked disks)
        (stacked C D)
        (stacked B C)
        (stacked A B)

        ; --- Clearance and Emptiness ---
        (clear A) ; Top disk
        (empty M) ; Middle peg is empty
        (empty R) ; Right peg is empty
        ; L is implicitly not empty
    )
    (:goal (and
        ; Final stack on R (D bottom, A top)
        (on D R)
        (stacked C D)
        (stacked B C)
        (stacked A B)

        ; Pegs L and M must be empty
        (empty L)
        (empty M)
        
        ; Disk A must be on top
        (clear A)
    ))
)