(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)        ; participant ?p is available for a meeting starting at slot ?s
    (attending ?p - participant ?s - slot)   ; participant ?p will attend the meeting at slot ?s
    (meeting_scheduled ?s - slot)            ; a meeting is scheduled to start at slot ?s
    (meeting_planned)                        ; a meeting (the single required meeting) has been planned
  )

  ;; Schedule a single meeting at slot ?s when three participants are free.
  ;; The meeting_planned flag prevents scheduling more than one meeting.
  (:action schedule_meeting
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (meeting_scheduled ?s))
      (not (meeting_planned))
    )
    :effect (and
      (meeting_scheduled ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
      (meeting_planned)
    )
  )
)