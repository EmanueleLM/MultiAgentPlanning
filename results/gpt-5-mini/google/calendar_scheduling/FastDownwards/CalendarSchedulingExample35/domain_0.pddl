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
    (blocked ?p - person ?t - timeslot)
    (meeting_unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?t - timeslot)
    (attends ?p - person ?m - meeting)
  )

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
      (blocked bradley ?t)
      (blocked zachary ?t)
      (blocked teresa ?t)
      (not (meeting_unscheduled ?m))
      (not (available bradley ?t))
      (not (available zachary ?t))
      (not (available teresa ?t))
    )
  )
)