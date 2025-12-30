(define (problem hanoi-4disks-R-to-L)
    (:domain hanoi-4disks)
    (:objects
        A B C D - disk  ; A smallest, D largest
        L M R - peg     ; Left, Middle, Right
    )
    
    (:init
        ;; Static smaller relations (A < B < C < D)
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
        
        ;; Initial Stack: D(base) -> C -> B -> A(top) on R (Right)
        (on D R)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
        
        ;; Clear/Empty status
        (clear A)
        (empty L)
        (empty M)
    )
    
    (:goal (and
        ;; Target Stack: D(base) -> C -> B -> A(top) on L (Left)
        (on D L)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
        (clear A)
        
        ;; Ensure M and R are empty
        (empty M)
        (empty R)
    ))