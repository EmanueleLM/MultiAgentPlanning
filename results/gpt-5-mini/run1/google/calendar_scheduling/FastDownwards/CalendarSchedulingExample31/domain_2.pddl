(define (domain jack_of_all_trades_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  ;; declare the three participants as domain-level constants so the domain
  ;; can refer to them directly (they are distinct by name)
  (:constants richard martha kimberly - participant)

  (:predicates
    (busy ?p - participant ?s - slot)
    (allowed ?p - participant ?s - slot)
    (meeting_done)
    (meeting_at ?s - slot)
    (assigned ?p - participant ?s - slot)
  )

  ;; Schedule the single meeting at one chosen slot for the three named participants.
  ;; Preconditions enforce availability and hard preferences for each participant.
  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
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