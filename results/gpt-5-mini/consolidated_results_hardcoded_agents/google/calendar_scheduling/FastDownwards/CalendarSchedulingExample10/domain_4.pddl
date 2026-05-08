(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free_for_all ?t - timeslot)    ; the timeslot is free for all required participants (hard constraint ensured in the problem init)
    (before_noon ?t - timeslot)     ; timeslot occurs before noon (encodes Janet's preference as a hard precondition)
    (meeting_scheduled)             ; terminal predicate: a meeting has been scheduled
    (next ?t1 - timeslot ?t2 - timeslot) ; explicit ordering relation between contiguous timeslots (informational / structural)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (before_noon ?t)
      (free_for_all ?t)
    )
    :effect (and
      (meeting_scheduled)
      (not (free_for_all ?t))  ; consume the slot so it cannot be reused (enforces contiguous occupancy for the duration)
    )
  )
)