(define (domain blocksworld_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (step0)
    (step1)
    (step2)
    (step3)
    (step4)
    (step5)
    (step6)
    (step7)
    (step8)
    (step9)
    (step10)
  )
  (:constants A B C D E F G H - block)

  ; Step 1: unstack D from F
  (:action unstack_D_from_F
    :precondition (and (step0) (on D F) (clear D) (handempty))
    :effect (and
      (not (on D F))
      (not (clear D))
      (not (handempty))
      (holding D)
      (clear F)
      (not (step0))
      (step1)
    )
  )

  ; Step 2: stack D onto C
  (:action stack_D_on_C
    :precondition (and (step1) (holding D) (clear C))
    :effect (and
      (on D C)
      (clear D)
      (not (holding D))
      (handempty)
      (not (clear C))
      (not (step1))
      (step2)
    )
  )

  ; Step 3: unstack A from G
  (:action unstack_A_from_G
    :precondition (and (step2) (on A G) (clear A) (handempty))
    :effect (and
      (not (on A G))
      (not (clear A))
      (not (handempty))
      (holding A)
      (clear G)
      (not (step2))
      (step3)
    )
  )

  ; Step 4: stack A onto F (first placement)
  (:action stack_A_on_F_first
    :precondition (and (step3) (holding A) (clear F))
    :effect (and
      (on A F)
      (clear A)
      (not (holding A))
      (handempty)
      (not (clear F))
      (not (step3))
      (step4)
    )
  )

  ; Step 5: unstack A from F
  (:action unstack_A_from_F
    :precondition (and (step4) (on A F) (clear A) (handempty))
    :effect (and
      (not (on A F))
      (not (clear A))
      (not (handempty))
      (holding A)
      (clear F)
      (not (step4))
      (step5)
    )
  )

  ; Step 6: stack A onto D
  (:action stack_A_on_D
    :precondition (and (step5) (holding A) (clear D))
    :effect (and
      (on A D)
      (clear A)
      (not (holding A))
      (handempty)
      (not (clear D))
      (not (step5))
      (step6)
    )
  )

  ; Step 7: pickup F (from table)
  (:action pickup_F_from_table
    :precondition (and (step6) (ontable F) (clear F) (handempty))
    :effect (and
      (not (ontable F))
      (not (clear F))
      (not (handempty))
      (holding F)
      (not (step6))
      (step7)
    )
  )

  ; Step 8: putdown F (onto table)
  (:action putdown_F_on_table
    :precondition (and (step7) (holding F))
    :effect (and
      (ontable F)
      (clear F)
      (handempty)
      (not (holding F))
      (not (step7))
      (step8)
    )
  )

  ; Step 9: unstack A from D
  (:action unstack_A_from_D
    :precondition (and (step8) (on A D) (clear A) (handempty))
    :effect (and
      (not (on A D))
      (not (clear A))
      (not (handempty))
      (holding A)
      (clear D)
      (not (step8))
      (step9)
    )
  )

  ; Step 10: stack A onto F (final)
  (:action stack_A_on_F_final
    :precondition (and (step9) (holding A) (clear F))
    :effect (and
      (on A F)
      (clear A)
      (not (holding A))
      (handempty)
      (not (clear F))
      (not (step9))
      (step10)
    )
  )
)