(define (problem BlocksworldHardScaling10)
    (:domain hanoi-6-disks)
    (:objects
        A B C D E F - disk
        L M R - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller C D) (smaller C E) (smaller C F)
        (smaller D E) (smaller D F)
        (smaller E F)
        
        (on-peg F M)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        (loc A M) (loc B M) (loc C M) (loc D M) (loc E M) (loc F M)
        
        (clear A)
        (clear L)
        (clear R)
    )
    
    (:goal (and
        (on-peg F R)
        (on E F)
        (on D E)
        (on C D)
        (on B C)
        (on A B)
        
        (loc A R) (loc B R) (loc C R) (loc D R) (loc E R) (loc F R)
        
        (clear L)
        (clear M)
    ))
    
    (:metric minimize (total-cost))
)