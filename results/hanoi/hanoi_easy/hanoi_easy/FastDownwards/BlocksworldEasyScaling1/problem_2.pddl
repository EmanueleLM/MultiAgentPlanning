(define (problem blocksworldeasyscaling1)
  (:domain hanoi-4disk)
  (:objects
    A B C D - disk  ; A (smallest) < B < C < D (largest)
    L M R - peg     ; Left, Middle, Right pegs
  )
  
  (:init
    ; Static Size relations
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ; Initial stacking on R (Right peg holds A top, D bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D R)

    ; Clearance status
    (clear A) ; A is the top disk
    (clear L) ; Left peg is empty
    (clear M) ; Middle peg is empty
  )
  
  (:goal (and
    ; Goal stacking on L (Left peg holds A top, D bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D L)
    
    ; Auxiliary pegs R and M must be empty (clear)
    (clear R)
    (clear M)
    
    ; Disk A must be clear
    (clear A)
  ))
)