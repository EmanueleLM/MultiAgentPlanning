(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions :adl :equality)
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

  (:action attend-raymond-preferred
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (preferred raymond ?s) (in-work-hours ?s) (free raymond))
    :effect (and (attending raymond ?s) (not (free raymond)))
  )

  (:action attend-raymond
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (in-work-hours ?s) (not (preferred raymond ?s)) (free raymond))
    :effect (and (attending raymond ?s) (not (free raymond)))
  )

  (:action attend-billy-preferred
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (preferred billy ?s) (in-work-hours ?s) (free billy))
    :effect (and (attending billy ?s) (not (free billy)))
  )

  (:action attend-billy
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (in-work-hours ?s) (not (preferred billy ?s)) (free billy))
    :effect (and (attending billy ?s) (not (free billy)))
  )

  (:action attend-donald-preferred
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (preferred donald ?s) (in-work-hours ?s) (free donald))
    :effect (and (attending donald ?s) (not (free donald)))
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (in-work-hours ?s) (not (preferred donald ?s)) (free donald))
    :effect (and (attending donald ?s) (not (free donald)))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (attending raymond ?s) (attending billy ?s) (attending donald ?s) (meeting-open) (in-work-hours ?s) (not (meeting-scheduled ?s)))
    :effect (and (meeting-scheduled ?s) (not (meeting-open)))
  )
)