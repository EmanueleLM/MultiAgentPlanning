(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Schedule action: schedules a single 30-minute slot (?s) for all participants.
  ;; Precondition: all participants must be available at ?s and no meeting scheduled yet.
  ;; Effect: mark meeting scheduled and remove availability at that slot for participants (to prevent re-use).
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available madison ?s)
      (available linda ?s)
      (available logan ?s)
      (available virginia ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (not (available madison ?s))
      (not (available linda ?s))
      (not (available logan ?s))
      (not (available virginia ?s))
    )
  )
)