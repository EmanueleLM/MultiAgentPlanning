(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free_for_all ?t - timeslot)    ; timeslot is free for all required participants
    (before_noon ?t - timeslot)     ; timeslot occurs before noon (encodes Janet's preference)
    (meeting_scheduled)             ; a meeting has been scheduled
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (before_noon ?t)
      (free_for_all ?t)
    )
    :effect (and
      (meeting_scheduled)
      (not (free_for_all ?t))
    )
  )
)