(define (problem blocks-1)
  (:domain blocks)

  ;; ---- Objects -----------------------------------------------------------
  (:objects
    E  A  D  B  C - block
  )

  ;; ---- Initial situation ------------------------------------------------
  (:init
    ;; The original stack:  E -> A -> D -> B -> C
    (ontable  E)          ; E is on the table
    (on       A E)        ; A on top of E
    (on       D A)        ; D on top of A
    (on       B D)        ; B on top of D
    (on       C B)        ; C on top of B
    (clear    C)          ; only the top block is clear
  )

  ;; ---- Goal situation ----------------------------------------------------
  (:goal (and
           (ontable  E)          ; E still on the table
           (on       C E)        ; C is moved on top of E
           (clear    C)          ; C remains clear
           (ontable  D)          ; D is put on a new stack on the table
           (on       A D)        ; A on top of D
           (on       B A)        ; B on top of A
           (clear    B)          ; B becomes clear
         ))
)