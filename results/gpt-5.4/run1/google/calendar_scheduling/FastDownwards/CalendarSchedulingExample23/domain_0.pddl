(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (next_slot ?s1 - slot ?s2 - slot)
    (busy ?p - participant ?s - slot)
    (valid_start ?s - slot)
    (scheduled ?m - meeting)
    (starts_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (not (scheduled ?m))
      (valid_start ?s1)
      (next_slot ?s1 ?s2)
      (not (busy billy ?s1))
      (not (busy billy ?s2))
      (not (busy maria ?s1))
      (not (busy maria ?s2))
      (not (busy william ?s1))
      (not (busy william ?s2))
    )
    :effect (and
      (scheduled ?m)
      (starts_at ?m ?s1)
    )
  )
)