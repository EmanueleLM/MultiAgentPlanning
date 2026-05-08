(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (busy ?p - participant ?t - timeslot)   ;; participant p is busy at timeslot t
    (meeting-scheduled)                     ;; a meeting has been scheduled
  )

  ;; Schedule a single 30-minute meeting for Adam, Jerry and Matthew at one timeslot.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled))
                    (not (busy adam ?t))
                    (not (busy jerry ?t))
                    (not (busy matthew ?t))
                  )
    :effect (and
              (meeting-scheduled)
              (busy adam ?t)
              (busy jerry ?t)
              (busy matthew ?t)
            )
  )
)