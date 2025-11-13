(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)    ; participant p is free during timeslot t
    (before_noon ?t - timeslot)              ; timeslot t is before noon (enforces Janet's preference)
    (next ?t1 - timeslot ?t2 - timeslot)     ; ordering: t2 immediately follows t1
    (meeting_scheduled)                      ; terminal condition: meeting has been scheduled
  )

  ;; Schedule a single 30-minute meeting in one concrete timeslot.
  ;; This action requires the chosen slot to be before noon and free for all three named participants.
  ;; It consumes (marks occupied) the free facts for those participants for that timeslot and sets the terminal predicate.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (before_noon ?t)
      (free diana ?t)
      (free ethan ?t)
      (free janet ?t)
    )
    :effect (and
      (meeting_scheduled)
      (not (free diana ?t))
      (not (free ethan ?t))
      (not (free janet ?t))
    )
  )
)