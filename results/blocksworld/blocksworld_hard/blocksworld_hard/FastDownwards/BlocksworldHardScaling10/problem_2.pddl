(define (problem blocksworld-hanoi-6)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        L M R - peg        ; Left, Middle, Right
    )
    (:init
        (= (total-cost) 0)
        
        ;; Size relationships (A < B < C < D < E < F)
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        ;; Initial configuration: Stack F-A on Middle peg (M)
        (on F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ;; Clears
        (clear A) ; Topmost disk
        (clear L) ; Left peg empty
        (clear R) ; Right peg empty
    )
    (:goal (and
        ;; Goal: Stack F-A on Right peg (R)
        (on F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ;; Left and Middle pegs must be empty (clear)
        (clear L)
        (clear M)
    ))
    (:metric minimize (total-cost))
)