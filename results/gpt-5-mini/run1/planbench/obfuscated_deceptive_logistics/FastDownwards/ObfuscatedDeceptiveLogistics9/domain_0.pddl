(define (domain workflow-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent data plan phase)

  (:predicates
    ;; static membership / assignments
    (observer-assigned ?a - agent)
    (reasoner-assigned ?a - agent)
    (auditor-assigned ?a - agent)
    (plan-slot ?p - plan ?d - data)            ;; defines which plan object is designated for which data

    ;; data and artifact lifecycle predicates
    (data-exists ?d - data)
    (collected ?d - data)
    (analyzed ?d - data)
    (plan-generated ?p - plan ?d - data)
    (plan-reviewed ?p - plan ?d - data)
    (remediation-applied ?p - plan ?d - data)
    (verified ?d - data ?p - plan)

    ;; phase bookkeeping to enforce strict ordering per data item
    (phase-completed ?phase - phase ?d - data)
    (phase-successor ?prev - phase ?next - phase)
  )

  ;; Observer fragment: data collection and final verification
  (:action obs_collect
    :parameters (?obs - agent ?d - data)
    :precondition (and
      (observer-assigned ?obs)
      (data-exists ?d)
      (phase-completed ph0 ?d)
      (not (collected ?d))
    )
    :effect (and
      (collected ?d)
      (phase-completed ph1 ?d)
    )
  )

  (:action obs_verify_final
    :parameters (?obs - agent ?d - data ?p - plan)
    :precondition (and
      (observer-assigned ?obs)
      (remediation-applied ?p ?d)
      (plan-generated ?p ?d)
      (phase-completed ph5 ?d)
      (not (verified ?d ?p))
    )
    :effect (and
      (verified ?d ?p)
      (phase-completed ph6 ?d)
    )
  )

  ;; Reasoner fragment: analysis and plan generation
  (:action rsn_analyze
    :parameters (?rsn - agent ?d - data)
    :precondition (and
      (reasoner-assigned ?rsn)
      (collected ?d)
      (phase-completed ph1 ?d)
      (not (analyzed ?d))
    )
    :effect (and
      (analyzed ?d)
      (phase-completed ph2 ?d)
    )
  )

  (:action rsn_generate_plan
    :parameters (?rsn - agent ?d - data ?p - plan)
    :precondition (and
      (reasoner-assigned ?rsn)
      (analyzed ?d)
      (plan-slot ?p ?d)
      (phase-completed ph2 ?d)
      (not (plan-generated ?p ?d))
    )
    :effect (and
      (plan-generated ?p ?d)
      (phase-completed ph3 ?d)
    )
  )

  ;; Auditor fragment: review and remediation
  (:action aud_review_plan
    :parameters (?aud - agent ?p - plan ?d - data)
    :precondition (and
      (auditor-assigned ?aud)
      (plan-generated ?p ?d)
      (phase-completed ph3 ?d)
      (not (plan-reviewed ?p ?d))
    )
    :effect (and
      (plan-reviewed ?p ?d)
      (phase-completed ph4 ?d)
    )
  )

  (:action aud_apply_remediation
    :parameters (?aud - agent ?p - plan ?d - data)
    :precondition (and
      (auditor-assigned ?aud)
      (plan-reviewed ?p ?d)
      (phase-completed ph4 ?d)
      (not (remediation-applied ?p ?d))
    )
    :effect (and
      (remediation-applied ?p ?d)
      (phase-completed ph5 ?d)
    )
  )
)