(define (domain meeting-scheduling)
  (:requirements :strips :typing :adl)
  (:types participant time)

  (:predicates
    (available ?p - participant ?t - time)    ;; participant p is available at start time t
    (worktime ?t - time)                     ;; t is within work hours (valid meeting start)
    (meeting-scheduled)                      ;; a meeting has been scheduled
    (scheduled-at ?t - time)                 ;; meeting is scheduled at time t
    (attending ?p - participant)             ;; participant p will attend the scheduled meeting
  )

  ;; Choose a meeting start time. Preconditions:
  ;;   - the time must be a worktime
  ;;   - every participant must be available at that time (universal quantifier)
  ;; Effects:
  ;;   - mark the meeting scheduled and scheduled-at that time
  ;;   - mark every participant as attending
  (:action choose-meeting-time
    :parameters (?t - time)
    :precondition (and
                    (worktime ?t)
                    ;; ensure every participant is available at ?t
                    (forall (?p - participant)
                      (available ?p ?t)
                    )
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              ;; mark all participants as attending
              (forall (?p - participant)
                (attending ?p)
              )
            )
  )
)