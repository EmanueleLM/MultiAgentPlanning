(define (domain multiagent-meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs :adl)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action agree-raymond-pref
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (preferred raymond ?s) (not (agreed raymond ?s)))
    :effect (and (agreed raymond ?s))
    :cost 0
  )

  (:action agree-raymond-other
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (not (preferred raymond ?s)) (not (agreed raymond ?s)))
    :effect (and (agreed raymond ?s))
    :cost 1
  )

  (:action agree-billy-pref
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (preferred billy ?s) (not (agreed billy ?s)))
    :effect (and (agreed billy ?s))
    :cost 0
  )

  (:action agree-billy-other
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (not (preferred billy ?s)) (not (agreed billy ?s)))
    :effect (and (agreed billy ?s))
    :cost 1
  )

  (:action agree-donald-pref
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (preferred donald ?s) (not (agreed donald ?s)))
    :effect (and (agreed donald ?s))
    :cost 0
  )

  (:action agree-donald-other
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (not (preferred donald ?s)) (not (agreed donald ?s)))
    :effect (and (agreed donald ?s))
    :cost 1
  )

  (:action confirm
    :parameters (?s - slot)
    :precondition (and (agreed raymond ?s) (agreed billy ?s) (agreed donald ?s) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (meeting-at ?s))
    :cost 0
  )
)