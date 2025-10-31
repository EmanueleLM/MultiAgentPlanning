; Orchestrator domain integrating two player summaries.
; Assumptions & mapping decisions:
; - The two structured summaries were not supplied. To remain conservative, each public action name
;   (paltry, sip, clip, wretched, memory, tightfisted) is modeled as a distinct deterministic task-action.
; - No additional resources, temporal slots, or availability data were provided; therefore actions have
;   minimal semantics: their only effect is to mark the corresponding task as done.
; - Natural-language preferences and temporal constraints were not present in the inputs; none are encoded.
; - Object identifiers are preserved as task names that match the action names.
; - If richer preconditions/effects exist in the original summaries, they were not available; this domain
;   is intentionally conservative and compatible with FastDownwards.
(define (domain orchestrator)
  (:requirements :strips :negative-preconditions :typing)
  (:types task)
  (:predicates
    (done ?t - task)
  )

  ;; action: paltry
  (:action paltry
    :parameters ()
    :precondition (not (done paltry))
    :effect (done paltry)
  )

  ;; action: sip
  (:action sip
    :parameters ()
    :precondition (not (done sip))
    :effect (done sip)
  )

  ;; action: clip
  (:action clip
    :parameters ()
    :precondition (not (done clip))
    :effect (done clip)
  )

  ;; action: wretched
  (:action wretched
    :parameters ()
    :precondition (not (done wretched))
    :effect (done wretched)
  )

  ;; action: memory
  (:action memory
    :parameters ()
    :precondition (not (done memory))
    :effect (done memory)
  )

  ;; action: tightfisted
  (:action tightfisted
    :parameters ()
    :precondition (not (done tightfisted))
    :effect (done tightfisted)
  )
)