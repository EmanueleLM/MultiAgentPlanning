; Resolutions and modelling choices:
; - The original specification described sequencing and strict ordering without runnable PDDL.
;   I resolved ambiguities by modelling the environment as an explicit linear sequence of phases:
;   ph1 -> ph2 -> ph3. Only a "ready" phase may be completed; completing a phase marks it done
;   and enables its successor to be ready. This enforces order and prevents skipping or reordering.
; - To avoid conditional effects (unsupported in plain STRIPS) the domain uses an explicit
;   successor relation (next). The final phase's successor is itself so the single generic
;   "orchestrator-advance" action can uniformly enable the successor without requiring
;   conditional effects or extra action variants.
; - All natural-language preferences are treated as hard constraints (must complete phases in order).
; - No penalty tokens, quotas, or post-hoc fixes are modelled; violation of ordering is impossible.
(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types phase)

  (:predicates
    (phase-ready ?p - phase)
    (phase-done ?p - phase)
    (next ?p ?q - phase)
  )

  ;; Action names are prefixed with the agent name to keep actions distinct per agent.
  (:action orchestrator-advance
    :parameters (?p - phase ?s - phase)
    :precondition (and
                    (phase-ready ?p)
                    (next ?p ?s)
                    (not (phase-done ?p))
                  )
    :effect (and
              (phase-done ?p)
              (not (phase-ready ?p))
              (phase-ready ?s)
            )
  )
)