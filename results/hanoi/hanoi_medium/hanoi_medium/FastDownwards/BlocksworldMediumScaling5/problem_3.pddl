(define (problem Hanoi-5-Disks)
  (:domain hanoi)
  (:objects
    A B C D E - disk ; A smallest, E largest
    L M R - peg    ; Left, Middle, Right
  )
  (:init
    ; Static Size relations: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
    
    ; Initial state: Stack (A B C D E) top to bottom on R
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    
    (base-on E R)
    
    ; Clear status
    (clear A)
    
    ; Peg status
    (peg-empty L)
    (peg-empty M)
    
    (= (total-cost) 0)
  )
  (:goal
    (and
      ; Target stack on L: (A B C D E)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (base-on E L)
      
      ; R and M must be empty
      (peg-empty R)
      (peg-empty M)
    )
  )
  (:metric minimize (total-cost))
)