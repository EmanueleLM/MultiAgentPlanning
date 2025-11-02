(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Single action that schedules the meeting in a slot only if all participants
  ;; (margaret, donna, helen) are available at that slot and no meeting has been scheduled yet.
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