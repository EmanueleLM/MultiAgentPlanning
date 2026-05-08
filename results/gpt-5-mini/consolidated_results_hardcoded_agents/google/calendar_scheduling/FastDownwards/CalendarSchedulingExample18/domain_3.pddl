(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)       ; participant p is free at timeslot t
    (candidate ?t - timeslot)              ; timeslot t is an audited candidate for the meeting
    (scheduled ?t - timeslot)              ; meeting has been scheduled at timeslot t
    (meeting-scheduled)                    ; a meeting has been scheduled (enforces at-most-one)
    (work-slot ?t - timeslot)              ; timeslot t lies within declared work hours
    (slot-next ?t1 - timeslot ?t2 - timeslot) ; immediate successor relation between adjacent slots
  )

  ;; Schedule a meeting at a single discrete timeslot.
  ;; Requires the timeslot to be an audited candidate, to lie inside work hours,
  ;; and all named participants to be free at that timeslot.
  ;; The negative precondition (not (meeting-scheduled)) enforces at most one meeting.
  ;; Effects mark the timeslot scheduled, mark the meeting as scheduled, and
  ;; remove the free facts for the participants at that timeslot to enforce
  ;; contiguous occupancy for the required duration (one slot).
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
    )
  )
)