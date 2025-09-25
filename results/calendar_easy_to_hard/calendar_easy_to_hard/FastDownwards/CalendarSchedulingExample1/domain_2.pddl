(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (attending ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (in-work-hours ?s - slot)
  )

  (:action attend-raymond-preferred
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (preferred raymond ?s) (in-work-hours ?s) (not (attending raymond ?s)))
    :effect (and (attending raymond ?s))
  )

  (:action attend-raymond
    :parameters (?s - slot)
    :precondition (and (available raymond ?s) (in-work-hours ?s) (not (preferred raymond ?s)) (not (attending raymond ?s)))
    :effect (and (attending raymond ?s))
  )

  (:action attend-billy-preferred
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (preferred billy ?s) (in-work-hours ?s) (not (attending billy ?s)))
    :effect (and (attending billy ?s))
  )

  (:action attend-billy
    :parameters (?s - slot)
    :precondition (and (available billy ?s) (in-work-hours ?s) (not (preferred billy ?s)) (not (attending billy ?s)))
    :effect (and (attending billy ?s))
  )

  (:action attend-donald-preferred
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (preferred donald ?s) (in-work-hours ?s) (not (attending donald ?s)))
    :effect (and (attending donald ?s))
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (and (available donald ?s) (in-work-hours ?s) (not (preferred donald ?s)) (not (attending donald ?s)))
    :effect (and (attending donald ?s))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (attending raymond ?s) (attending billy ?s) (attending donald ?s) (not (meeting-scheduled ?s)))
    :effect (and (meeting-scheduled ?s))
  )
)