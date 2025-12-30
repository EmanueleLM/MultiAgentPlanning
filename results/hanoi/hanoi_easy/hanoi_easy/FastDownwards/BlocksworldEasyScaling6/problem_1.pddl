(define (problem hanoi-4-disks)
    (:domain tower-of-hanoi)
    (:objects
        A B C D - disk  ; A smallest, D largest
        L M R - peg     ; Left, Middle, Right
    )
    (:init
        ; --- Size relations (Static) ---
        ; A is smaller than B, C, D
        (smaller A B) (smaller A C) (smaller A D)
        ; B is smaller than C, D
        (smaller B C) (smaller B D)
        ; C is smaller than D
        (smaller C D)

        ; --- Initial State (All disks on L: D bottom, A top) ---
        (on D L)
        (on C D)
        (on B C)
        (on A B)

        ; --- Clearance ---
        (clear A) ; Top disk
        (clear M) ; Empty peg
        (clear R) ; Empty peg
    )
    (:goal (and
        ; Final stack on R (D bottom, A top)
        (on D R)
        (on C D)
        (on B C)
        (on A B)

        ; Pegs L and M must be empty (clear)
        (clear L)
        (clear M)
        
        ; Disk A must be on top
        (clear A)
    ))
)