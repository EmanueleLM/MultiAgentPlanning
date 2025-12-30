(define (problem hanoi-6disk-MtoR)
  (:domain hanoi-6disk)
  (:objects
    A B C D E F - disk
    L M R - peg
  )
  (:init
    ; Initial Configuration: F(bottom) E D C B A(top) on M
    (on F M)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; Clearance
    (clear A) ; Top disk
    (clear L) ; Empty peg
    (clear R) ; Empty peg
    ; M, F, E, D, C, B are not clear

    ; Static size relations (A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    (= (total-cost) 0)
  )
  (:goal (and
    ; Target Configuration: F(bottom) E D C B A(top) on R
    (on F R)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
  (:metric minimize (total-cost))
)