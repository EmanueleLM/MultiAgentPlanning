(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person slot)

  ;; declare the three required participants as domain constants so actions can
  ;; refer to them directly and the problem does not need to redeclare them
  (:constants heather nicholas zachary - person)

  (:predicates
    ;; participant availability in a 30-minute slot
    (available ?p - person ?s - slot)

    ;; soft preference marker (not enforced as hard constraint)
    (preferred ?p - person ?s - slot)

    ;; scheduling bookkeeping: ensure only one meeting is scheduled
    (no-meeting-scheduled)
    (meeting-scheduled)
    (scheduled ?s - slot)

    ;; assignment of a participant to a scheduled slot
    (assigned ?p - person ?s - slot)
  )

  ;; Schedule a 30-minute meeting in a single slot for the three required participants.
  ;; This action is specific to this instance because the participants are domain constants.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (no-meeting-scheduled)
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (not (no-meeting-scheduled))
      (meeting-scheduled)
      (scheduled ?s)
      (assigned heather ?s)
      (assigned nicholas ?s)
      (assigned zachary ?s)
    )
  )
)