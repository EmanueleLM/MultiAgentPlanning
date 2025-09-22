(define (domain multiagent-meeting)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:constants raymond billy donald - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action agree-pref
    :parameters (?a - agent ?s - slot)
    :precondition (and (available ?a ?s) (preferred ?a ?s) (not (agreed ?a ?s)))
    :effect (and (agreed ?a ?s))
    :cost 0
  )

  (:action agree-other
    :parameters (?a - agent ?s - slot)
    :precondition (and (available ?a ?s) (not (preferred ?a ?s)) (not (agreed ?a ?s)))
    :effect (and (agreed ?a ?s))
    :cost 1
  )

  (:action confirm
    :parameters (?s - slot)
    :precondition (and (agreed raymond ?s) (agreed billy ?s) (agreed donald ?s) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (meeting-at ?s))
    :cost 0
  )
)