(define (problem hanoi-7-to-middle)
    (:domain hanoi-7-disk)
    (:objects
        L M R - peg
        A B C D E F G - disk ; A smallest, G largest
    )
    (:init
        ; --- Size constraints (D1 smaller than D2) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
        (smaller C D) (smaller C E) (smaller C F) (smaller C G)
        (smaller D E) (smaller D F) (smaller D G)
        (smaller E F) (smaller E G)
        (smaller F G)

        ; --- Initial Stack on L (A top, G bottom) ---
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on-peg G L)

        ; --- Clear status ---
        (clear A) ; A is on top
        ; Disks B through G are NOT clear
        (peg-clear M) ; M is empty
        (peg-clear R) ; R is empty
    )
    (:goal (and
        ; Target stack on M
        (on A B)
        (on B C)
        (on C D)
        (on D E)
        (on E F)
        (on F G)
        (on-peg G M)

        ; L and R must be empty
        (peg-clear L)
        (peg-clear R)
    ))
)