(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)
    (occupied ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )

  ;; Schedule a single 30-minute meeting for Adam, Jerry and Matthew at a timeslot.
  ;; Preconditions: no meeting has been scheduled yet and the three participants
  ;; are free at that timeslot.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled))
                    (free adam ?t)
                    (free jerry ?t)
                    (free matthew ?t)
                 )
    :effect (and
              (meeting-scheduled)
              (scheduled ?t)
              (occupied adam ?t) (occupied jerry ?t) (occupied matthew ?t)
              (not (free adam ?t)) (not (free jerry ?t)) (not (free matthew ?t))
            )
  )
)