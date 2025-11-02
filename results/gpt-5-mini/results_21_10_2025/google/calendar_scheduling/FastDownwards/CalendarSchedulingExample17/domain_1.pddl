(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Schedule the meeting in a single 30-minute slot only if all participants
  ;; are available at that slot and no meeting has yet been scheduled.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available margaret ?s)
      (available donna ?s)
      (available helen ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)