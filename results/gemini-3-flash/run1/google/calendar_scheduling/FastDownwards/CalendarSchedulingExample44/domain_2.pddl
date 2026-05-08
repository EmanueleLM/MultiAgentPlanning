(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types slot)
  (:predicates
    (isabella_free ?s - slot)
    (ronald_free ?s - slot)
    (amanda_free ?s - slot)
    (is_preferred ?s - slot)
    (meeting_scheduled)
  )

  ;; The meeting is half an hour long. Each slot represents a 30-minute window.
  ;; For the meeting to be scheduled at a slot, all participants must be free during it.
  ;; We also include the preference constraint as a hard precondition to ensure the found solution respects it.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (isabella_free ?s)
      (ronald_free ?s)
      (amanda_free ?s)
      (is_preferred ?s)
    )
    :effect (meeting_scheduled)
  )
)