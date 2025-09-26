(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)   ; participant ?p can attend meeting starting at slot ?s
    (scheduled ?s - slot)                   ; meeting scheduled at slot ?s
    (meeting-scheduled)                     ; a meeting has been scheduled
  )

  ; Schedule a one-hour meeting at slot ?s only if every named participant is available at ?s,
  ; and no meeting has been scheduled yet. Participant identities are explicit to keep constraints traceable.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available denise ?s)
      (available joseph ?s)
      (available henry ?s)
      (available christian ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)