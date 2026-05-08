(define (domain jack_of_all_trades_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (busy ?p - participant ?s - slot)
    (allowed ?p - participant ?s - slot)
    (meeting_done)
    (meeting_at ?s - slot)
    (assigned ?p - participant ?s - slot)
  )

  ;; Schedule the single meeting at one chosen slot.
  ;; Preconditions explicitly enforce availability and hard preferences for every participant.
  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting_done))
      ;; richard requirements
      (allowed richard ?s)
      (not (busy richard ?s))
      ;; martha requirements
      (allowed martha ?s)
      (not (busy martha ?s))
      ;; kimberly requirements
      (allowed kimberly ?s)
      (not (busy kimberly ?s))
    )
    :effect (and
      (meeting_done)
      (meeting_at ?s)
      (assigned richard ?s)
      (assigned martha ?s)
      (assigned kimberly ?s)
    )
  )
)