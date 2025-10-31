(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs :fluents :adl)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (attending ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (in-work-hours ?s - slot)
    (free ?a - agent)
    (meeting-open)
  )

  (:functions (total-cost))

  (:action attend-raymond-preferred
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (preferred raymond ?s) (in-work-hours ?s) (free raymond))
    :effect (and (attending raymond ?s) (not (free raymond)) (increase (total-cost) 0))
  )

  (:action attend-raymond
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (in-work-hours ?s) (not (preferred raymond ?s)) (free raymond))
    :effect (and (attending raymond ?s) (not (free raymond)) (increase (total-cost) 1))
  )

  (:action attend-billy-preferred
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (preferred billy ?s) (in-work-hours ?s) (free billy))
    :effect (and (attending billy ?s) (not (free billy)) (increase (total-cost) 0))
  )

  (:action attend-billy
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (in-work-hours ?s) (not (preferred billy ?s)) (free billy))
    :effect (and (attending billy ?s) (not (free billy)) (increase (total-cost) 1))
  )

  (:action attend-donald-preferred
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (preferred donald ?s) (in-work-hours ?s) (free donald))
    :effect (and (attending donald ?s) (not (free donald)) (increase (total-cost) 0))
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (in-work-hours ?s) (not (preferred donald ?s)) (free donald))
    :effect (and (attending donald ?s) (not (free donald)) (increase (total-cost) 1))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (attending raymond ?s) (attending billy ?s) (attending donald ?s) (meeting-open) (in-work-hours ?s) (not (meeting-scheduled ?s)))
    :effect (and (meeting-scheduled ?s) (not (meeting-open)) (increase (total-cost) 0))
  )
)