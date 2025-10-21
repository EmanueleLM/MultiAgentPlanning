(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)      ; person ?p is available at slot ?s
    (gerald-pref ?s - slot)                ; slot ?s satisfies Gerald's strict preference (>=13:00 preferred slots)
    (scheduled)                            ; a meeting has been scheduled
    (meeting-at ?s - slot)                 ; the meeting is scheduled at slot ?s
  )

  ;; Agent-related action distinct for the Gerald+Barbara pair.
  ;; This action schedules the meeting at a slot only if:
  ;; - Gerald is available at that slot
  ;; - Barbara is available at that slot
  ;; - Gerald's strict preference (temporal constraint) accepts that slot
  ;; - No meeting has yet been scheduled
  (:action schedule-gerald-barbara
    :parameters (?s - slot)
    :precondition (and
      (available gerald ?s)
      (available barbara ?s)
      (gerald-pref ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)