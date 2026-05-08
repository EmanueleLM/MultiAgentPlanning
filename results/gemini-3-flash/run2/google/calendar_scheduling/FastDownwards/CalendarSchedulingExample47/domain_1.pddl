(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?s - timeslot)
    (next ?s1 ?s2 - timeslot)
    (meeting_scheduled)
  )

  ;; A meeting of one hour requires two consecutive 30-minute slots.
  ;; All participants (david, eric, and roger) must be available in both slots.
  (:action schedule_1hr_meeting
    :parameters (?s1 ?s2 - timeslot)
    :precondition (and
      (next ?s1 ?s2)
      (available david ?s1)
      (available david ?s2)
      (available eric ?s1)
      (available eric ?s2)
      (available roger ?s1)
      (available roger ?s2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)