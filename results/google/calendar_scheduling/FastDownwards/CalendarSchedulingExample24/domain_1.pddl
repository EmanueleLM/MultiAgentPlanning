(define (domain orchestrated-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot meeting)

  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (is-meeting ?m - meeting)

    (available ?p - person ?s - slot)
    (preferred ?p - person ?s - slot)
    (within-workhours ?s - slot)
    (occupied ?s - slot)
    (pending-confirmation ?p - person ?m - meeting)

    (free ?p - person ?s - slot)

    (meeting-scheduled-a2 ?m - meeting ?s - slot)
    (in-meeting ?p - person ?m - meeting)

    (scheduled-a3 ?s - slot)

    (scheduled-a1 ?m - meeting ?s - slot)
  )

  (:action schedule-meeting-A1
    :parameters (?m - meeting ?s - slot ?organizer - person)
    :precondition (and
      (is-meeting ?m)
      (slot ?s)
      (within-workhours ?s)
      (available ?organizer ?s)
      (preferred ?organizer ?s)
      (not (occupied ?s))
    )
    :effect (and
      (scheduled-a1 ?m ?s)
      (occupied ?s)
      (meeting-scheduled-a2 ?m ?s)
      (scheduled-a3 ?s)
      (in-meeting ?organizer ?m)
    )
  )

  (:action request-confirmation-A1
    :parameters (?p - person ?m - meeting)
    :precondition (and
      (person ?p)
      (is-meeting ?m)
    )
    :effect (pending-confirmation ?p ?m)
  )

  (:action schedule-A2
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (meeting-scheduled-a2 ?m ?s))
    )
    :effect (and
      (meeting-scheduled-a2 ?m ?s)
      (in-meeting ?p1 ?m)
      (in-meeting ?p2 ?m)
      (in-meeting ?p3 ?m)
      (scheduled-a1 ?m ?s)
      (scheduled-a3 ?s)
      (occupied ?s)
    )
  )

  (:action schedule-meeting-A3
    :parameters (?m - meeting ?s - slot ?p - person)
    :precondition (and
      (is-meeting ?m)
      (slot ?s)
      (free ?p ?s)
      (not (occupied ?s))
    )
    :effect (and
      (scheduled-a3 ?s)
      (meeting-scheduled-a2 ?m ?s)
      (scheduled-a1 ?m ?s)
      (in-meeting ?p ?m)
      (occupied ?s)
    )
  )
)