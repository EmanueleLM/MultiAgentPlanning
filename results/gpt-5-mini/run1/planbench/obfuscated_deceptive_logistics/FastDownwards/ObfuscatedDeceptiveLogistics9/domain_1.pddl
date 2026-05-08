(define (domain workflow-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent data plan phase)

  (:predicates
    (observer-assigned ?a - agent)
    (reasoner-assigned ?a - agent)
    (auditor-assigned ?a - agent)
    (plan-slot ?p - plan ?d - data)

    (data-exists ?d - data)
    (collected ?d - data)
    (analyzed ?d - data)
    (plan-generated ?p - plan ?d - data)
    (plan-reviewed ?p - plan ?d - data)
    (remediation-applied ?p - plan ?d - data)
    (verified ?d - data ?p - plan)

    (phase-completed ?phase - phase ?d - data)
    (phase-successor ?prev - phase ?next - phase)
  )

  (:action obs_collect
    :parameters (?obs - agent ?d - data ?prev - phase ?next - phase)
    :precondition (and
      (observer-assigned ?obs)
      (data-exists ?d)
      (phase-successor ?prev ?next)
      (phase-completed ?prev ?d)
      (not (collected ?d))
    )
    :effect (and
      (collected ?d)
      (phase-completed ?next ?d)
    )
  )

  (:action obs_verify_final
    :parameters (?obs - agent ?d - data ?p - plan ?prev - phase ?next - phase)
    :precondition (and
      (observer-assigned ?obs)
      (remediation-applied ?p ?d)
      (plan-generated ?p ?d)
      (phase-successor ?prev ?next)
      (phase-completed ?prev ?d)
      (not (verified ?d ?p))
    )
    :effect (and
      (verified ?d ?p)
      (phase-completed ?next ?d)
    )
  )

  (:action rsn_analyze
    :parameters (?rsn - agent ?d - data ?prev - phase ?next - phase)
    :precondition (and
      (reasoner-assigned ?rsn)
      (collected ?d)
      (phase-successor ?prev ?next)
      (phase-completed ?prev ?d)
      (not (analyzed ?d))
    )
    :effect (and
      (analyzed ?d)
      (phase-completed ?next ?d)
    )
  )

  (:action rsn_generate_plan
    :parameters (?rsn - agent ?d - data ?p - plan ?prev - phase ?next - phase)
    :precondition (and
      (reasoner-assigned ?rsn)
      (analyzed ?d)
      (plan-slot ?p ?d)
      (phase-successor ?prev ?next)
      (phase-completed ?prev ?d)
      (not (plan-generated ?p ?d))
    )
    :effect (and
      (plan-generated ?p ?d)
      (phase-completed ?next ?d)
    )
  )

  (:action aud_review_plan
    :parameters (?aud - agent ?p - plan ?d - data ?prev - phase ?next - phase)
    :precondition (and
      (auditor-assigned ?aud)
      (plan-generated ?p ?d)
      (phase-successor ?prev ?next)
      (phase-completed ?prev ?d)
      (not (plan-reviewed ?p ?d))
    )
    :effect (and
      (plan-reviewed ?p ?d)
      (phase-completed ?next ?d)
    )
  )

  (:action aud_apply_remediation
    :parameters (?aud - agent ?p - plan ?d - data ?prev - phase ?next - phase)
    :precondition (and
      (auditor-assigned ?aud)
      (plan-reviewed ?p ?d)
      (phase-successor ?prev ?next)
      (phase-completed ?prev ?d)
      (not (remediation-applied ?p ?d))
    )
    :effect (and
      (remediation-applied ?p ?d)
      (phase-completed ?next ?d)
    )
  )
)