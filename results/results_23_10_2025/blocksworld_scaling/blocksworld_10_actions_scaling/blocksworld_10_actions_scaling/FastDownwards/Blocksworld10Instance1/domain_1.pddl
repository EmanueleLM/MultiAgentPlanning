(define (domain blocksworld_serial_steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on top of ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x
    (holding ?x - block)          ; the single hand holds ?x
    (handempty)                   ; the single hand is empty
    (step0) (step1) (step2) (step3) (step4)
    (step5) (step6) (step7) (step8) (step9) (step10)
  )

  ;; Step 1: pickup(A) by agent_alpha
  (:action pickup-alpha-A-step1
    :precondition (and (ontable A) (clear A) (handempty) (step0))
    :effect (and
      (not (ontable A))
      (not (handempty))
      (holding A)
      (not (clear A))
      (not (step0))
      (step1)
    )
  )

  ;; Step 2: putdown(A) by agent_alpha
  (:action putdown-alpha-A-step2
    :precondition (and (holding A) (step1))
    :effect (and
      (ontable A)
      (clear A)
      (handempty)
      (not (holding A))
      (not (step1))
      (step2)
    )
  )

  ;; Step 3: unstack(B, E) by agent_alpha
  (:action unstack-alpha-B-from-E-step3
    :precondition (and (on B E) (clear B) (handempty) (step2))
    :effect (and
      (holding B)
      (clear E)
      (not (on B E))
      (not (handempty))
      (not (clear B))
      (not (step2))
      (step3)
    )
  )

  ;; Step 4: stack(B, E) by agent_alpha
  (:action stack-alpha-B-onto-E-step4
    :precondition (and (holding B) (clear E) (step3))
    :effect (and
      (on B E)
      (clear B)
      (handempty)
      (not (holding B))
      (not (clear E))
      (not (step3))
      (step4)
    )
  )

  ;; Step 5: unstack(B, E) again by agent_alpha
  (:action unstack-alpha-B-from-E-step5
    :precondition (and (on B E) (clear B) (handempty) (step4))
    :effect (and
      (holding B)
      (clear E)
      (not (on B E))
      (not (handempty))
      (not (clear B))
      (not (step4))
      (step5)
    )
  )

  ;; Step 6: putdown(B) by agent_beta
  (:action putdown-beta-B-step6
    :precondition (and (holding B) (step5))
    :effect (and
      (ontable B)
      (clear B)
      (handempty)
      (not (holding B))
      (not (step5))
      (step6)
    )
  )

  ;; Step 7: pickup(A) by agent_beta
  (:action pickup-beta-A-step7
    :precondition (and (ontable A) (clear A) (handempty) (step6))
    :effect (and
      (not (ontable A))
      (not (handempty))
      (holding A)
      (not (clear A))
      (not (step6))
      (step7)
    )
  )

  ;; Step 8: putdown(A) by agent_beta
  (:action putdown-beta-A-step8
    :precondition (and (holding A) (step7))
    :effect (and
      (ontable A)
      (clear A)
      (handempty)
      (not (holding A))
      (not (step7))
      (step8)
    )
  )

  ;; Step 9: unstack(E, F) by agent_beta
  (:action unstack-beta-E-from-F-step9
    :precondition (and (on E F) (clear E) (handempty) (step8))
    :effect (and
      (holding E)
      (clear F)
      (not (on E F))
      (not (handempty))
      (not (clear E))
      (not (step8))
      (step9)
    )
  )

  ;; Step 10: putdown(E) by agent_beta
  (:action putdown-beta-E-step10
    :precondition (and (holding E) (step9))
    :effect (and
      (ontable E)
      (clear E)
      (handempty)
      (not (holding E))
      (not (step9))
      (step10)
    )
  )
)