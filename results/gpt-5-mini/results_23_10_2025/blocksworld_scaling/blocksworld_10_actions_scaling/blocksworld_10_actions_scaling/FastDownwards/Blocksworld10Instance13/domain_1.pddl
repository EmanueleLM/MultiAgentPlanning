(define (domain blocks-world-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    ;; step markers enforcing the specific given sequence (step0 .. step10)
    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9) (step10)
  )

  ;; Action 1: pickup(E) at step0 -> step1
  (:action pickup-E-step1
    :parameters ()
    :precondition (and (ontable E) (clear E) (handempty) (step0))
    :effect (and
              (holding E)
              (not (ontable E))
              (not (handempty))
              (not (step0))
              (step1)
            )
  )

  ;; Action 2: stack(E, A) at step1 -> step2
  (:action stack-E-on-A-step2
    :parameters ()
    :precondition (and (holding E) (clear A) (step1))
    :effect (and
              (on E A)
              (clear E)
              (handempty)
              (not (holding E))
              (not (clear A))
              (not (step1))
              (step2)
            )
  )

  ;; Action 3: unstack(E, A) at step2 -> step3
  (:action unstack-E-from-A-step3
    :parameters ()
    :precondition (and (on E A) (clear E) (handempty) (step2))
    :effect (and
              (holding E)
              (clear A)
              (not (on E A))
              (not (handempty))
              (not (step2))
              (step3)
            )
  )

  ;; Action 4: putdown(E) at step3 -> step4
  (:action putdown-E-step4
    :parameters ()
    :precondition (and (holding E) (step3))
    :effect (and
              (ontable E)
              (clear E)
              (handempty)
              (not (holding E))
              (not (step3))
              (step4)
            )
  )

  ;; Action 5: unstack(A, B) at step4 -> step5
  (:action unstack-A-from-B-step5
    :parameters ()
    :precondition (and (on A B) (clear A) (handempty) (step4))
    :effect (and
              (holding A)
              (clear B)
              (not (on A B))
              (not (handempty))
              (not (step4))
              (step5)
            )
  )

  ;; Action 6: putdown(A) at step5 -> step6
  (:action putdown-A-step6
    :parameters ()
    :precondition (and (holding A) (step5))
    :effect (and
              (ontable A)
              (clear A)
              (handempty)
              (not (holding A))
              (not (step5))
              (step6)
            )
  )

  ;; Action 7: pickup(E) at step6 -> step7
  (:action pickup-E-step7
    :parameters ()
    :precondition (and (ontable E) (clear E) (handempty) (step6))
    :effect (and
              (holding E)
              (not (ontable E))
              (not (handempty))
              (not (step6))
              (step7)
            )
  )

  ;; Action 8: putdown(E) at step7 -> step8
  (:action putdown-E-step8
    :parameters ()
    :precondition (and (holding E) (step7))
    :effect (and
              (ontable E)
              (clear E)
              (handempty)
              (not (holding E))
              (not (step7))
              (step8)
            )
  )

  ;; Action 9: pickup(E) at step8 -> step9
  (:action pickup-E-step9
    :parameters ()
    :precondition (and (ontable E) (clear E) (handempty) (step8))
    :effect (and
              (holding E)
              (not (ontable E))
              (not (handempty))
              (not (step8))
              (step9)
            )
  )

  ;; Action 10: putdown(E) at step9 -> step10
  (:action putdown-E-step10
    :parameters ()
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