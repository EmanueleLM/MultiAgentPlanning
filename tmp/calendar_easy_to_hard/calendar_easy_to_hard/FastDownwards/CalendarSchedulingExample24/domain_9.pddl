(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person slot meeting)

  (:predicates
    (within_workhours ?s - slot)
    (busy ?p - person ?s - slot)
    (occupied ?s - slot)
    (participant_of ?m - meeting ?p - person)
    (confirmed ?m - meeting ?p - person)
    (meeting_at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
  )

  (:action confirm
    :parameters (?m - meeting ?s - slot ?p - person)
    :precondition (and
      (participant_of ?m ?p)
      (within_workhours ?s)
      (not (busy ?p ?s))
      (not (occupied ?s))
      (not (confirmed ?m ?p))
    )
    :effect (and
      (confirmed ?m ?p)
    )
  )

  (:action finalize_meeting
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (within_workhours ?s)
      (not (occupied ?s))
      (participant_of ?m ?p1) (confirmed ?m ?p1)
      (participant_of ?m ?p2) (confirmed ?m ?p2)
      (participant_of ?m ?p3) (confirmed ?m ?p3)
      (not (scheduled ?m))
    )
    :effect (and
      (meeting_at ?m ?s)
      (scheduled ?m)
      (occupied ?s)
    )
  )
)