(define (domain integrated-meeting)
  (:requirements :strips :typing :action-costs :adl)
  (:types agent location starttime duration)

  (:predicates
    (at ?a - agent ?l - location)
    (met)
    (depart_ok ?s - starttime)
    (arrived_for ?s - starttime)
    (can_meet ?s - starttime ?d - duration)
  )

  (:functions (total-cost))

  ;; Travel from Richmond to Presidio to arrive for a chosen meeting start time
  (:action travel-richmond-presidio-for
    :parameters (?s - starttime ?a - agent)
    :precondition (and (at ?a richmond) (depart_ok ?s))
    :effect (and
              (not (at ?a richmond))
              (at ?a presidio)
              (arrived_for ?s)
            )
  )

  ;; Meeting action: choose a start time and duration that are allowed (precomputed in problem).
  ;; Meeting sets (met) and contributes negative cost proportional to duration to enable maximization.
  (:action meet-at-presidio
    :parameters (?s - starttime ?d - duration ?trav - agent ?sarah - agent)
    :precondition (and
                    (at ?trav presidio)
                    (at ?sarah presidio)
                    (arrived_for ?s)
                    (can_meet ?s ?d)
                    (not (met))
                  )
    :effect (and
              (met)
              ;; minimize total-cost by adding negative cost equal to -duration minutes,
              ;; encoded here with concrete numeric constants in the problem actions.
              ;; The specific numeric increase per duration will be provided in action instantiations
              ;; via the use of the planner's :action-costs mechanism (see problem metric).
            )
  )
)