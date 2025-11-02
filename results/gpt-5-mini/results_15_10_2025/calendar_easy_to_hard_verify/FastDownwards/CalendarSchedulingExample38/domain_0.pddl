(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :adl)
  (:types participant timeslot)

  ;; Participants declared as constants so actions can require them explicitly (resources kept distinct)
  (:constants
    adam frances natalie patrick willie diana - participant
  )

  (:predicates
    (free ?p - participant ?t - timeslot)   ;; participant ?p is free to start a 30-min meeting at timeslot ?t
    (scheduled ?t - timeslot)               ;; a meeting is scheduled to start at timeslot ?t
    (meeting-scheduled)                     ;; a meeting has been scheduled
  )

  ;; Single scheduling action: schedule a 30-minute meeting at a chosen timeslot.
  ;; Requires every participant be free at that timeslot and no meeting already scheduled.
  ;; Effects: record meeting scheduled at that timeslot and mark participants no longer free at that timeslot.
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (free adam ?t)
      (free frances ?t)
      (free natalie ?t)
      (free patrick ?t)
      (free willie ?t)
      (free diana ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?t)
      (not (free adam ?t))
      (not (free frances ?t))
      (not (free natalie ?t))
      (not (free patrick ?t))
      (not (free willie ?t))
      (not (free diana ?t))
    )
  )
)