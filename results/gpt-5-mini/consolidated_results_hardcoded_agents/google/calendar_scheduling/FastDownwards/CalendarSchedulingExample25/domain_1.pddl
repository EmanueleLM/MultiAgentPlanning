(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (available ?p - participant ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  ;; Select the audited recommended slot only when every required participant
  ;; is explicitly available for that slot. This action uses the actual participant
  ;; names in the precondition to enforce that Anthony, Pamela, and Zachary
  ;; are all available (no possibility to substitute or omit participants).
  (:action select_slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      ;; Explicit availability requirements for each participant (hard constraints)
      (available Anthony ?s)
      (available Pamela ?s)
      (available Zachary ?s)
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)