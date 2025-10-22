(define (domain blocksworld_serial_steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:constants A B C D E F G - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (step0) (step1) (step2) (step3) (step4)
    (step5) (step6) (step7) (step8) (step9) (step10)
  )

  (:action pickup-alpha-A-step1
    :parameters ()
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

  (:action putdown-alpha-A-step2
    :parameters ()
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

  (:action unstack-alpha-B-from-E-step3
    :parameters ()
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

  (:action stack-alpha-B-onto-E-step4
    :parameters ()
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

  (:action unstack-alpha-B-from-E-step5
    :parameters ()
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

  (:action putdown-beta-B-step6
    :parameters ()
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

  (:action pickup-beta-A-step7
    :parameters ()
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

  (:action putdown-beta-A-step8
    :parameters ()
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

  (:action unstack-beta-E-from-F-step9
    :parameters ()
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

  (:action putdown-beta-E-step10
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