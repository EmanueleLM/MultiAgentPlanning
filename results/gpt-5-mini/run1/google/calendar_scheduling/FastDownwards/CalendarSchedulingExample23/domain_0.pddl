(define (domain meeting-scheduling)
  ; FastDownward-compatible domain for scheduling a single 1-hour meeting among three participants.
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timepoint)
  (:predicates
    (available-for-meeting ?p - participant ?t - timepoint)
    (attended ?p - participant ?t - timepoint)
    (meeting-scheduled ?t - timepoint)
  )

  ; Distinct attend actions for each participant (agent-specific actions).
  (:action attend-participant-1
    :parameters (?t - timepoint)
    :precondition (and
      (available-for-meeting participant_1 ?t)
      (not (attended participant_1 ?t))
    )
    :effect (attended participant_1 ?t)
  )

  (:action attend-participant-2
    :parameters (?t - timepoint)
    :precondition (and
      (available-for-meeting participant_2 ?t)
      (not (attended participant_2 ?t))
    )
    :effect (attended participant_2 ?t)
  )

  (:action attend-participant-3
    :parameters (?t - timepoint)
    :precondition (and
      (available-for-meeting participant_3 ?t)
      (not (attended participant_3 ?t))
    )
    :effect (attended participant_3 ?t)
  )

  ; Confirmation action that finalizes the meeting only when all participants have attended (for same start time).
  (:action confirm-meeting
    :parameters (?t - timepoint)
    :precondition (and
      (attended participant_1 ?t)
      (attended participant_2 ?t)
      (attended participant_3 ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (meeting-scheduled ?t)
  )
)