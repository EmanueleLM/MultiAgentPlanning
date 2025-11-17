(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (busy ?p - participant ?t - timeslot)      ;; participant p is busy at timeslot t
    (meeting-scheduled)                        ;; a meeting has been scheduled
    (meeting-at ?t - timeslot)                 ;; meeting is scheduled at timeslot t
    (next ?t1 - timeslot ?t2 - timeslot)       ;; ordering: t2 follows t1
  )

  ;; Schedule a single 30-minute meeting for Adam, Jerry and Matthew at one contiguous timeslot.
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
              (meeting-at ?t)
              (busy adam ?t)
              (busy jerry ?t)
              (busy matthew ?t)
            )
  )
)