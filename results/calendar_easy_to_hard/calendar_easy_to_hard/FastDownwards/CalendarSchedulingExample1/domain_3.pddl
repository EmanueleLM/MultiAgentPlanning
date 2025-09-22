(define (domain meeting-domain)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants raymond billy donald - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (preferred ?a - agent ?s - slot)
    (work-slot ?s - slot)
    (chosen ?a - agent ?s - slot)
    (scheduled ?s - slot)
    (attending ?a - agent ?s - slot)
    (meeting-scheduled)
  )

  (:action choose-raymond
    :parameters (?s - slot)
    :precondition (and (work-slot ?s) (available raymond ?s))
    :effect (chosen raymond ?s)
  )

  (:action choose-billy
    :parameters (?s - slot)
    :precondition (and (work-slot ?s) (available billy ?s))
    :effect (chosen billy ?s)
  )

  (:action choose-donald
    :parameters (?s - slot)
    :precondition (and (work-slot ?s) (available donald ?s))
    :effect (chosen donald ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (chosen raymond ?s) (chosen billy ?s) (chosen donald ?s))
    :effect (and (scheduled ?s)
                 (attending raymond ?s)
                 (attending billy ?s)
                 (attending donald ?s)
                 (meeting-scheduled))
  )
)