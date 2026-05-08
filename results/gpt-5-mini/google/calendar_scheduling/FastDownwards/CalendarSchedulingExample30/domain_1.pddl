(define (domain jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (work_slot ?s - slot)
    (busy ?p - participant ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (meeting_before_14)
    (before_14 ?s - slot)
  )

  ;; Generic scheduling action: schedule a meeting in a slot for three participants.
  ;; The action requires the slot be a work_slot, before 14:00, no meeting already
  ;; scheduled, and all three participants free in that slot. Effects mark the
  ;; meeting scheduled, the meeting location, participants busy in that slot,
  ;; and the meeting_before_14 marker.
  (:action schedule_slot
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (work_slot ?s)
      (before_14 ?s)
      (not (meeting_scheduled))
      (not (busy ?p1 ?s))
      (not (busy ?p2 ?s))
      (not (busy ?p3 ?s))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
      (busy ?p1 ?s)
      (busy ?p2 ?s)
      (busy ?p3 ?s)
      (meeting_before_14)
    )
  )
)