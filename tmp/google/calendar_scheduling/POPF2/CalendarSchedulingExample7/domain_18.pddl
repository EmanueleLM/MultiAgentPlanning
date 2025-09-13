(define (domain unified-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality :conditional-effects)
  (:types participant time-slot)
  
  (:predicates
    (available ?p - participant ?t - time-slot)
    (meeting-scheduled ?t - time-slot)
    (participant-attending ?p - participant ?t - time-slot)
    (slot-before-14 ?t - time-slot)
    (preference-meet-early-zachary ?t - time-slot)
  )

  (:action schedule-meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t - time-slot)
    :precondition (and
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (meeting-scheduled ?t)
      (participant-attending ?p1 ?t)
      (participant-attending ?p2 ?t)
      (participant-attending ?p3 ?t)
    )
  )

  (:action prefer-early-meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t - time-slot)
    :precondition (and
      (meeting-scheduled ?t)
      (slot-before-14 ?t)
      (preference-meet-early-zachary ?t)
    )
    :effect (and
      (participant-attending ?p1 ?t)
      (participant-attending ?p2 ?t)
      (participant-attending ?p3 ?t)
    )
    :cost 1
  )
)