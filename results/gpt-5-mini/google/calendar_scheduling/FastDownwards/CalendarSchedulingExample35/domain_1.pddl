(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting timeslot)

  (:constants
    bradley zachary teresa - person
    meeting_m1 - meeting
  )

  (:predicates
    (required_to_attend ?p - person ?m - meeting)
    (available ?p - person ?t - timeslot)
    (meeting_unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?t - timeslot)
    (attends ?p - person ?m - meeting)
  )

  ;; Schedule the (half-hour) meeting at a single timeslot.
  ;; Preconditions require the meeting still unscheduled, each required
  ;; attendee to be listed as required, and each to be available at the slot.
  ;; Effects mark the meeting scheduled, record the timeslot, mark each
  ;; attendee as attending, and remove the availability at that slot so the
  ;; slot is treated as occupied for them.
  (:action schedule_meeting_at
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting_unscheduled ?m)
      (required_to_attend bradley ?m)
      (required_to_attend zachary ?m)
      (required_to_attend teresa ?m)
      (available bradley ?t)
      (available zachary ?t)
      (available teresa ?t)
    )
    :effect (and
      (scheduled_at ?m ?t)
      (meeting_scheduled ?m)
      (attends bradley ?m)
      (attends zachary ?m)
      (attends teresa ?m)
      (not (meeting_unscheduled ?m))
      (not (available bradley ?t))
      (not (available zachary ?t))
      (not (available teresa ?t))
    )
  )
)