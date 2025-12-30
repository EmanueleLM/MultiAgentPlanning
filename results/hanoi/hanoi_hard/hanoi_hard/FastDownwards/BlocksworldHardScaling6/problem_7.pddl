(define (problem BlocksworldHardScaling6)
    (:domain blocksworld)
    (:objects 
        A B C D E F - block ; Disks (A=smallest, F=largest)
        L M R - block        ; Pegs (Left, Middle, Right)
    )
    
    (:init 
        ; Static: Disk identification
        (is_disk A) (is_disk B) (is_disk C) 
        (is_disk D) (is_disk E) (is_disk F)
        
        ; Static: Size hierarchy 
        ; A < B/C/D/E/F/L/M/R
        (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
        (smaller A L) (smaller A M) (smaller A R)
        
        ; B < C/D/E/F/L/M/R
        (smaller B C) (smaller B D) (smaller B E) (smaller B F)
        (smaller B L) (smaller B M) (smaller B R)
        
        ; C < D/E/F/L/M/R
        (smaller C D) (smaller C E) (smaller C F)
        (smaller C L) (smaller C M) (smaller C R)
        
        ; D < E/F/L/M/R
        (smaller D E) (smaller D F)
        (smaller D L) (smaller D M) (smaller D R)

        ; E < F/L/M/R
        (smaller E F)
        (smaller E L) (smaller E M) (smaller E R)
        
        ; F < L/M/R
        (smaller F L) (smaller F M) (smaller F R)
        
        ; Dynamic: Initial State configuration (Stack A/B/C/D/E/F on L, top to bottom)
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on F L)
        
        ; Clearance
        (clear A)
        (clear M) ; M is empty base
        (clear R) ; R is empty base
        
        (handempty)
        (= (total-cost) 0)
    )
    
    (:goal (and 
        ; Goal: Stack A/B/C/D/E/F on R
        (on A B) (on B C) (on C D) (on D E) (on E F)
        (on F R)
        (clear A)
        
        ; L and M must be empty (clear)
        (clear L)
        (clear M)
    ))

    (:metric minimize (total-cost))
)