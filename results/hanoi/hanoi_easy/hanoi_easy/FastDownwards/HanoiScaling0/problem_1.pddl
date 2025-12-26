(define (problem hanoi-4disks-problem)
    (:domain hanoi-4disks)
    (:objects
        A B C D - disk
        Left Middle Right - peg
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Size relations: A < B < C < D
        (smaller A B) (smaller A C) (smaller A D)
        (smaller B C) (smaller B D)
        (smaller C D)
        
        ;; Initial state: Stack [A, B, C, D] on Middle peg (A on top, D on bottom)
        
        ;; Location definitions
        (on-peg D Middle)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
        
        ;; Clear status: A is clear. B, C, D are covered.
        (clear-disk A)
        (not (clear-disk B)) 
        (not (clear-disk C))
        (not (clear-disk D)) 
        
        ;; Peg clear status
        (not (clear-peg Middle))
        (clear-peg Left)
        (clear-peg Right)
    )
    
    (:goal (and
        ; Goal: Stack [A, B, C, D] on Right peg
        (on-peg D Right)
        (on-disk C D)
        (on-disk B C)
        (on-disk A B)
        
        ; Ensuring other pegs are empty is required by the specification 
        ; ("Left and Middle pegs must be empty").
        (clear-peg Left)
        (clear-peg Middle)
    ))
    
    (:metric minimize (total-cost))
)