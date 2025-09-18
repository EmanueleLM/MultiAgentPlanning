(define (domain orchestrator-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot hour_start person)

  (:predicates
    ;; participant-specific free predicates (keeps each participant's notion distinct)
    (free_a ?s - slot)            ; Arthur: free for this 30-min slot
    (free_s ?s - slot)            ; Samantha: free for this 30-min slot
    (free_m ?h - hour_start)      ; Michael: free for this 1-hour start (on the hour)

    ;; adjacency and mappings
    (succ ?s1 ?s2 - slot)         ; ?s2 immediately follows ?s1 (30 minutes later)
    (hour_slots ?h ?s1 ?s2 - (either hour_start slot)) ; mapping: hour start -> two consecutive 30-min slots
    (covers_half ?s ?h1 ?h2 - (either slot hour_start)) ; mapping: meeting start at half-hour -> two hour_start entries it overlaps

    ;; scheduling outcome
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  ;; Schedule a meeting that starts exactly on the hour (e.g., 9:00-10:00).
  ;; This action corresponds to Michael's "on-the-hour" model.
  (:action schedule_on_hour
    :parameters (?h - hour_start ?s1 - slot ?s2 - slot)
    :precondition (and
      (hour_slots ?h ?s1 ?s2)
      (succ ?s1 ?s2)
      (free_m ?h)
      (free_a ?s1)
      (free_a ?s2)
      (free_s ?s1)
      (free_s ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s1)
      (not (free_a ?s1))
      (not (free_a ?s2))
      (not (free_s ?s1))
      (not (free_s ?s2))
      (not (free_m ?h))
    )
  )

  ;; Schedule a meeting that starts on the half-hour (e.g., 9:30-10:30).
  ;; A half-hour start overlaps two "hour_start" slots for Michael (previous and next hour).
  (:action schedule_on_half
    :parameters (?s - slot ?s2 - slot ?h1 - hour_start ?h2 - hour_start)
    :precondition (and
      (succ ?s ?s2)
      (covers_half ?s ?h1 ?h2)
      (free_m ?h1)
      (free_m ?h2)
      (free_a ?s)
      (free_a ?s2)
      (free_s ?s)
      (free_s ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (free_a ?s))
      (not (free_a ?s2))
      (not (free_s ?s))
      (not (free_s ?s2))
      (not (free_m ?h1))
      (not (free_m ?h2))
    )
  )
)