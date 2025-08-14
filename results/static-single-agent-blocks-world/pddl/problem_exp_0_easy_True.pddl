(define (problem blocks-problem)
  (:domain blocks)

  (:objects A B C D E - block)

  ;;; Initial state ---------------------------------------------------------
  (:init
    ;  All blocks are on the table and clear
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)

    ;  The agent’s hand is free
    (handempty)
  )

  ;;; Goal ----------------------------------------------------------
  (:goal (and
           ; D on table, E on top of D and clear
           (ontable D)
           (on E D)
           (clear E)

           ; C on table and clear
           (ontable C)
           (clear C)

           ; A on table
           (ontable A)

           ; B on top of A and clear
           (on B A)
           (clear B)
         ))
)