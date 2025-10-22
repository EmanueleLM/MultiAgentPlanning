(define (domain blocks-world-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?p - block)      ; ?b is directly on ?p (p may be another block or the table)
    (clear ?b - block)              ; nothing is on top of ?b
    (holding ?a - agent ?b - block) ; agent ?a is holding block ?b
    (handempty ?a - agent)          ; agent ?a has an empty hand
    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9)
    (step10) (step11) (step12) (step13) (step14) (step15) (step16) (step17) (step18) (step19) (step20)
  )

  ;; Each domain action encodes exactly one step of the given sequence.
  ;; The step predicates enforce the exact ordering: step0 -> step1 -> ... -> step20.
  ;; All actions use an agent parameter; the verification problem gives robot1 the responsibility.
  ;; Only the top block (clear ...) can be moved and the mover must have an empty hand when picking/unstacking.

  (:action do-step-1-unstack-e-from-d
    :parameters (?a - agent)
    :precondition (and (step0) (on e d) (clear e) (handempty ?a))
    :effect (and
      (not (on e d))
      (not (handempty ?a))
      (holding ?a e)
      (clear d)
      (not (step0)) (step1)
    )
  )

  (:action do-step-2-putdown-e-on-table
    :parameters (?a - agent)
    :precondition (and (step1) (holding ?a e))
    :effect (and
      (not (holding ?a e))
      (on e table)
      (handempty ?a)
      (clear e)
      (not (step1)) (step2)
    )
  )

  (:action do-step-3-pickup-e-from-table
    :parameters (?a - agent)
    :precondition (and (step2) (on e table) (clear e) (handempty ?a))
    :effect (and
      (not (on e table))
      (not (handempty ?a))
      (holding ?a e)
      (not (step2)) (step3)
    )
  )

  (:action do-step-4-putdown-e-on-table
    :parameters (?a - agent)
    :precondition (and (step3) (holding ?a e))
    :effect (and
      (not (holding ?a e))
      (on e table)
      (handempty ?a)
      (clear e)
      (not (step3)) (step4)
    )
  )

  (:action do-step-5-pickup-e-from-table
    :parameters (?a - agent)
    :precondition (and (step4) (on e table) (clear e) (handempty ?a))
    :effect (and
      (not (on e table))
      (not (handempty ?a))
      (holding ?a e)
      (not (step4)) (step5)
    )
  )

  (:action do-step-6-stack-e-onto-f
    :parameters (?a - agent)
    :precondition (and (step5) (holding ?a e) (clear f))
    :effect (and
      (not (holding ?a e))
      (on e f)
      (handempty ?a)
      (not (clear f))
      (clear e)
      (not (step5)) (step6)
    )
  )

  (:action do-step-7-unstack-d-from-h
    :parameters (?a - agent)
    :precondition (and (step6) (on d h) (clear d) (handempty ?a))
    :effect (and
      (not (on d h))
      (not (handempty ?a))
      (holding ?a d)
      (clear h)
      (not (step6)) (step7)
    )
  )

  (:action do-step-8-stack-d-onto-a
    :parameters (?a - agent)
    :precondition (and (step7) (holding ?a d) (clear a))
    :effect (and
      (not (holding ?a d))
      (on d a)
      (handempty ?a)
      (not (clear a))
      (clear d)
      (not (step7)) (step8)
    )
  )

  (:action do-step-9-pickup-h-from-table
    :parameters (?a - agent)
    :precondition (and (step8) (on h table) (clear h) (handempty ?a))
    :effect (and
      (not (on h table))
      (not (handempty ?a))
      (holding ?a h)
      (not (step8)) (step9)
    )
  )

  (:action do-step-10-stack-h-onto-d
    :parameters (?a - agent)
    :precondition (and (step9) (holding ?a h) (clear d))
    :effect (and
      (not (holding ?a h))
      (on h d)
      (handempty ?a)
      (not (clear d))
      (clear h)
      (not (step9)) (step10)
    )
  )

  (:action do-step-11-unstack-h-from-d
    :parameters (?a - agent)
    :precondition (and (step10) (on h d) (clear h) (handempty ?a))
    :effect (and
      (not (on h d))
      (not (handempty ?a))
      (holding ?a h)
      (clear d)
      (not (step10)) (step11)
    )
  )

  (:action do-step-12-stack-h-onto-d
    :parameters (?a - agent)
    :precondition (and (step11) (holding ?a h) (clear d))
    :effect (and
      (not (holding ?a h))
      (on h d)
      (handempty ?a)
      (not (clear d))
      (clear h)
      (not (step11)) (step12)
    )
  )

  (:action do-step-13-unstack-e-from-f
    :parameters (?a - agent)
    :precondition (and (step12) (on e f) (clear e) (handempty ?a))
    :effect (and
      (not (on e f))
      (not (handempty ?a))
      (holding ?a e)
      (clear f)
      (not (step12)) (step13)
    )
  )

  (:action do-step-14-putdown-e-on-table
    :parameters (?a - agent)
    :precondition (and (step13) (holding ?a e))
    :effect (and
      (not (holding ?a e))
      (on e table)
      (handempty ?a)
      (clear e)
      (not (step13)) (step14)
    )
  )

  (:action do-step-15-unstack-h-from-d
    :parameters (?a - agent)
    :precondition (and (step14) (on h d) (clear h) (handempty ?a))
    :effect (and
      (not (on h d))
      (not (handempty ?a))
      (holding ?a h)
      (clear d)
      (not (step14)) (step15)
    )
  )

  (:action do-step-16-putdown-h-on-table
    :parameters (?a - agent)
    :precondition (and (step15) (holding ?a h))
    :effect (and
      (not (holding ?a h))
      (on h table)
      (handempty ?a)
      (clear h)
      (not (step15)) (step16)
    )
  )

  (:action do-step-17-pickup-h-from-table
    :parameters (?a - agent)
    :precondition (and (step16) (on h table) (clear h) (handempty ?a))
    :effect (and
      (not (on h table))
      (not (handempty ?a))
      (holding ?a h)
      (not (step16)) (step17)
    )
  )

  (:action do-step-18-stack-h-onto-e
    :parameters (?a - agent)
    :precondition (and (step17) (holding ?a h) (clear e))
    :effect (and
      (not (holding ?a h))
      (on h e)
      (handempty ?a)
      (not (clear e))
      (clear h)
      (not (step17)) (step18)
    )
  )

  (:action do-step-19-unstack-d-from-a
    :parameters (?a - agent)
    :precondition (and (step18) (on d a) (clear d) (handempty ?a))
    :effect (and
      (not (on d a))
      (not (handempty ?a))
      (holding ?a d)
      (clear a)
      (not (step18)) (step19)
    )
  )

  (:action do-step-20-stack-d-onto-h
    :parameters (?a - agent)
    :precondition (and (step19) (holding ?a d) (clear h))
    :effect (and
      (not (holding ?a d))
      (on d h)
      (handempty ?a)
      (not (clear h))
      (clear d)
      (not (step19)) (step20)
    )
  )
)