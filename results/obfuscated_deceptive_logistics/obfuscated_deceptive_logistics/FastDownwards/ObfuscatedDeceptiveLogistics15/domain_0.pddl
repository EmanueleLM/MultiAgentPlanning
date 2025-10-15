(define (domain multi-agent-scheduling)
  (:requirements :strips :typing)
  (:types agent room slot meeting)

  (:predicates
    (free-slot ?s - slot)
    (room-free ?r - room ?s - slot)
    (available ?a - agent ?s - slot)
    (required ?m - meeting ?a - agent)
    (scheduled ?m - meeting ?s - slot ?r - room)
    (attending ?a - agent ?m - meeting)
  )

  (:action schedule-meeting
    :parameters (?m - meeting ?r - room ?s - slot)
    :precondition (and
      (free-slot ?s)
      (room-free ?r ?s)
    )
    :effect (and
      (scheduled ?m ?s ?r)
      (not (free-slot ?s))
      (not (room-free ?r ?s))
    )
  )

  (:action add-attendee
    :parameters (?m - meeting ?a - agent ?s - slot ?r - room)
    :precondition (and
      (scheduled ?m ?s ?r)
      (available ?a ?s)
      (required ?m ?a)
    )
    :effect (and
      (attending ?a ?m)
    )
  )
)