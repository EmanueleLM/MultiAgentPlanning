(define (problem BlocksworldHardScaling10)
    (:domain hanoi-6-disks-optimized)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    
    (:init
        ; 1. Cost and Sizes (7 facts total)
        (= (total-cost) 0)
        (= (disk-size A) 1)
        (= (disk-size B) 2)
        (= (disk-size C) 3)
        (= (disk-size D) 4)
        (= (disk-size E) 5)
        (= (disk-size F) 6)
        
        ; 2. Initial Stack Configuration (6 facts)
        ; Stack M: F (bottom) ... A (top)
        (on-peg F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; 3. Initial locations (6 facts)
        (loc A M) (loc B M) (loc C M) (loc D M) (loc E M) (loc F M)
        
        ; 4. Clear status (3 facts)
        (clear A) ; Top disk
        (clear L) ; Empty peg
        (clear R) ; Empty peg
    )
    
    (:goal (and
        ; Final stack R: F (bottom) ... A (top)
        (on-peg F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        ; Final locations 
        (loc A R) (loc B R) (loc C R) (loc D R) (loc E R) (loc F R)
        
        ; Pegs L and M must be empty
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)