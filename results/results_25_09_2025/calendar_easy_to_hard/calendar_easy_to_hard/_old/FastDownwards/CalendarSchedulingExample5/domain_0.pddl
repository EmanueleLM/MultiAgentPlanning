(define (domain integrated-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types person time meeting)

  (:predicates
    (available ?p - person ?t - time)       ; person is available at a 30-min start time
    (not-scheduled)                         ; no meeting has been scheduled yet (Kathryn-style)
    (meeting-scheduled)                     ; a meeting has been scheduled (Charlotte-style)
    (meeting-at ?t - time)                  ; meeting scheduled at start time
    (scheduled ?m - meeting ?t - time)      ; meeting object m scheduled at time t (Lauren-style)
    (unscheduled ?m - meeting)              ; meeting object m is unscheduled (Lauren-style)
  )

  ;; Action provided by Kathryn (renamed to keep actions distinct)
  (:action schedule-kathryn
    :parameters (?m - meeting ?t - time)
    :precondition (and
      (unscheduled ?m)                     ; lauren-style unscheduled meeting object
      (not (meeting-scheduled))            ; charlotte-style negative precondition
      (not-scheduled)                      ; kathryn-style flag
      (available kathryn ?t)
      (available charlotte ?t)
      (available lauren ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
      (meeting-scheduled)
      (meeting-at ?t)
      (not (not-scheduled))
    )
  )

  ;; Action provided by Charlotte (renamed to keep actions distinct)
  (:action schedule-charlotte
    :parameters (?m - meeting ?t - time)
    :precondition (and
      (unscheduled ?m)
      (not (meeting-scheduled))
      (not-scheduled)
      (available charlotte ?t)
      (available kathryn ?t)
      (available lauren ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
      (meeting-scheduled)
      (meeting-at ?t)
      (not (not-scheduled))
    )
  )

  ;; Action provided by Lauren (renamed to keep actions distinct)
  (:action schedule-lauren
    :parameters (?m - meeting ?t - time)
    :precondition (and
      (unscheduled ?m)
      (not (meeting-scheduled))
      (not-scheduled)
      (available lauren ?t)
      (available kathryn ?t)
      (available charlotte ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
      (meeting-scheduled)
      (meeting-at ?t)
      (not (not-scheduled))
    )
  )
)