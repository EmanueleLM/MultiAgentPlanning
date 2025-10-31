(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot time)

  (:predicates
    ;; agent-specific availability predicates (distinct per agent)
    (available-raymond ?s - slot)
    (available-billy ?s - slot)
    (available-donald ?s - slot)

    ;; meeting bookkeeping
    (meeting-scheduled)
    (scheduled ?s - slot)

    ;; explicit attendance facts per participant
    (attends-raymond ?s - slot)
    (attends-billy ?s - slot)
    (attends-donald ?s - slot)

    ;; encoded administrative facts for work hours & duration (informational,
    ;; present to encode work hours and meeting duration as requested)
    (work-hours-start ?t - time)
    (work-hours-end ?t - time)
    (meeting-duration-30)
  )

  ;; Single generic action that schedules the meeting at a single 30-minute slot.
  ;; It requires that all participants are available at the same slot and that no
  ;; meeting has been scheduled yet. Effects record the meeting and attendances.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available-raymond ?s)
      (available-billy ?s)
      (available-donald ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
      (attends-raymond ?s)
      (attends-billy ?s)
      (attends-donald ?s)
    )
  )
)