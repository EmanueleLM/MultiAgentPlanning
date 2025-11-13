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
  ;; Requires the chosen timeslot to be within work hours and all listed participants free.
  ;; The (not (meeting-scheduled)) precondition enforces at-most-one meeting.
  ;; Effects record the scheduled timeslot and remove participant availability and candidate mark,
  ;; preventing reuse of the same slot and ensuring contiguous occupancy constraints (for multi-slot meetings
  ;; the domain would require checking successive slots; for a one-slot meeting this action consumes the slot).
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
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
      (not (free ?p3 ?t))
      (not (candidate ?t))
    )
  )
)