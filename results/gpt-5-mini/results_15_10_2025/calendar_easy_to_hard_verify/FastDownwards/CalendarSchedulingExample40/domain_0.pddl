(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (busy ?p - person ?s - slot)        ; participant is unavailable for a meeting starting at slot
    (identified ?s - slot)              ; slot has been identified as free for all participants
    (assigned ?s - slot)                ; meeting assigned to this slot
    (meeting-scheduled)                 ; meeting has been scheduled
  )

  ;; Identify a slot as feasible if no participant is busy at that slot.
  ;; The preconditions explicitly reference every participant (hard constraints).
  (:action identify-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (identified ?s))
      (not (busy rachel ?s))
      (not (busy katherine ?s))
      (not (busy kelly ?s))
      (not (busy cynthia ?s))
      (not (busy anthony ?s))
      (not (busy ryan ?s))
      (not (busy richard ?s))
    )
    :effect (identified ?s)
  )

  ;; Assign a meeting to an already-identified slot.
  (:action assign-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (identified ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (assigned ?s)
    )
  )
)