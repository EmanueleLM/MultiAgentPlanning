(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (work_slot ?s - slot)
    (before_14 ?s - slot)
    (busy ?p - participant ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (meeting_before_14)
  )

  ;; Instance-specific scheduling action that schedules the meeting
  ;; for the three participants exactly: jeffrey, virginia, melissa.
  ;; Using an instance-specific action avoids needing equality checks
  ;; or parameter distinctness constraints.
  (:action schedule_meeting_jeffrey_virginia_melissa
    :parameters (?s - slot)
    :precondition (and
      (work_slot ?s)
      (before_14 ?s)
      (not (meeting_scheduled))
      (not (busy jeffrey ?s))
      (not (busy virginia ?s))
      (not (busy melissa ?s))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
      (busy jeffrey ?s)
      (busy virginia ?s)
      (busy melissa ?s)
      (meeting_before_14)
    )
  )
)