(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (occupied ?p - participant ?t - timeslot)
    (meeting-scheduled)
  )

  ;; Schedule a single 30-minute meeting for Adam, Jerry and Matthew at a timeslot.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled))
                    (not (occupied adam ?t))
                    (not (occupied jerry ?t))
                    (not (occupied matthew ?t))
                  )
    :effect (and
              (meeting-scheduled)
              (occupied adam ?t)
              (occupied jerry ?t)
              (occupied matthew ?t)
            )
  )
)