(define (problem BlocksworldHardScaling10)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk ; A smallest, F largest
        L M R - peg        ; Left, Middle, Right
    )
    
    (:init
        (= (total-cost) 0)
        
        ; --- Static Predicates (Size hierarchy) ---
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        ; --- Initial Configuration: Stack F-A on Middle (M) ---
        ; Stack hierarchy (bottom up: F E D C B A)
        (on-peg F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Location tracking (all disks start on M)
        (loc A M) (loc B M) (loc C M) (loc D M) (loc E M) (loc F M)
        
        ; Clear status
        (clear A) ; Top disk
        (clear L) ; Empty peg
        (clear R) ; Empty peg
        (not (clear M)) ; M occupied by F
        (not (clear F)) ; F occupied by E
        (not (clear E))
        (not (clear D))
        (not (clear C))
        (not (clear B))
    )
    
    (:goal (and
        ; Target stack on Right (R): F E D C B A
        (on-peg F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; All disks located on R
        (loc A R) (loc B R) (loc C R) (loc D R) (loc E R) (loc F R)
        
        ; L and M must be empty
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)