(define (problem hanoi-7disk-M_to_R)
  (:domain hanoi-7disk)
  (:objects
    A B C D E F G - disk ; A smallest, G largest
    L M R - peg
  )
  (:init
    (= (total-cost) 0)
    ; --- Static Size relations (A < B < C < D < E < F < G) ---
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ; --- Initial State: Stack G->A on Middle Peg (M) ---
    (bottom G M)
    (on F G) (on E F) (on D E) (on C D) (on B C) (on A B)

    ; --- Initial Clearance ---
    (clear-disk A)
    (clear-peg L)
    (clear-peg R)
  )
  (:goal (and
    ; Target State: Stack G->A on Right Peg (R)
    (bottom G R)
    (on F G) (on E F) (on D E) (on C D) (on B C) (on A B)

    ; Left (L) and Middle (M) pegs must be empty
    (clear-peg L)
    (clear-peg M)
  ))
  (:metric minimize (total-cost))
)