(define (problem hanoi-6-m-to-r)
  (:domain tower-of-hanoi)
  (:objects
    A B C D E F - disk
    L M R - peg
  )
  (:init
    (= (total-cost) 0)

    ; Size relations (A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ; Initial Stack on M: A (top) ... F (bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F M)

    ; Clarity: A is clear, L and R pegs are clear (empty)
    (clear A)
    (clear L)
    (clear R)
  )
  (:goal (and
    ; Final Stack on R: A (top) ... F (bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F R)
    
    ; L and M pegs must be clear
    (clear L)
    (clear M) 
  ))
  (:metric minimize (total-cost))
)