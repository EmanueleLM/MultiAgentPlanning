(define (domain meeting-scheduling)
  (:requirements :typing :strips :equality :negative-preconditions :disjunctive-preconditions :action-costs)
  (:types participant slot meeting)
  (:predicates
    (attendee ?p - participant ?m - meeting)
    (available ?p - participant ?s - slot)
    (scheduled ?m - meeting)
    (meeting-at ?m - meeting ?s - slot)
    (slot-in-working-hours ?s - slot)
    (all-attendees-available ?m - meeting ?s - slot)
    (slot-free ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (slot-in-working-hours ?s)
      (slot-free ?s)
      (all-attendees-available ?m ?s)
    )
    :effect (and
      (scheduled ?m)
      (meeting-at ?m ?s)
      (not (slot-free ?s))
    )
    :cost 1
  )
)