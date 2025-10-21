(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot meeting)

  ;; Participants are domain constants so the schedule action can require each by name.
  (:constants
    adam jerry matthew - person
  )

  (:predicates
    ;; participant ?p is free for the 30-minute timeslot ?t
    (free ?p - person ?t - timeslot)

    ;; meeting bookkeeping
    (scheduled ?m - meeting)
    (meeting-scheduled ?m - meeting ?t - timeslot)
  )

  ;; Schedule the meeting at a specific timeslot only if it has not already been scheduled
  ;; and every required participant is free for that full 30-minute timeslot.
  (:action schedule
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (free adam ?t)
      (free jerry ?t)
      (free matthew ?t)
    )
    :effect (and
      (scheduled ?m)
      (meeting-scheduled ?m ?t)
      ;; mark that those participants are no longer free at that timeslot
      (not (free adam ?t))
      (not (free jerry ?t))
      (not (free matthew ?t))
    )
  )
)