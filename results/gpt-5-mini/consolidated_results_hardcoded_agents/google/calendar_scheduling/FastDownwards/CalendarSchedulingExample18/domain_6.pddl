(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)                ; participant p is free at timeslot t
    (candidate ?t - timeslot)                       ; timeslot t is an audited candidate to schedule
    (scheduled ?t - timeslot)                       ; meeting has been scheduled at timeslot t
    (meeting-scheduled)                             ; a meeting has been scheduled (enforces at-most-one)
    (work-slot ?t - timeslot)                       ; timeslot t lies within declared work hours
    (slot-next ?t1 - timeslot ?t2 - timeslot)       ; immediate successor relation between adjacent slots
  )

  ;; Schedule the meeting in one audited candidate timeslot.
  ;; This action requires the chosen timeslot to be within work hours and all participants free.
  ;; It enforces contiguous occupancy structurally by operating on a single concrete timeslot object
  ;; (meeting duration equals one discrete timeslot with the given granularity).
  (:action schedule-meeting
    :parameters (?t - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (candidate ?t)
      (work-slot ?t)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
      ;; Remove availability for the three participants at this timeslot to prevent reuse.
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
      (not (free ?p3 ?t))
      ;; Remove the candidate mark so the solver cannot treat it as available after scheduling.
      (not (candidate ?t))
    )
  )
)