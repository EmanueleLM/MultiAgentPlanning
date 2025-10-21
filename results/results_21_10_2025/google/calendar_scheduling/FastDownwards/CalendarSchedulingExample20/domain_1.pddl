(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (available ?p - participant ?s - slot)   ; participant is available at slot
    (proposed ?s - slot)                     ; a slot has been proposed
    (confirmed ?p - participant ?s - slot)   ; participant confirmed the proposed slot
    (scheduled ?s - slot)                    ; a specific slot has been scheduled
    (scheduled-any)                          ; a meeting has been scheduled (any slot)
  )

  ;; Propose a candidate slot
  (:action propose-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (proposed ?s))
      (not (scheduled ?s))
    )
    :effect (proposed ?s)
  )

  ;; Ralph confirms a proposed slot
  (:action ralph-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available ralph ?s)
      (not (confirmed ralph ?s))
    )
    :effect (confirmed ralph ?s)
  )

  ;; Peter confirms a proposed slot
  (:action peter-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available peter ?s)
      (not (confirmed peter ?s))
    )
    :effect (confirmed peter ?s)
  )

  ;; Daniel confirms a proposed slot
  ;; (Daniel's preference to avoid meetings after 13:30 is enforced in the problem
  ;; by only listing him available for slots at or before 13:00 where appropriate.)
  (:action daniel-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available daniel ?s)
      (not (confirmed daniel ?s))
    )
    :effect (confirmed daniel ?s)
  )

  ;; Finalize scheduling once all participants have confirmed
  ;; This action marks the specific slot as scheduled and also sets scheduled-any
  ;; so the problem goal can be to schedule some slot without naming it explicitly.
  (:action finalize
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (confirmed ralph ?s)
      (confirmed peter ?s)
      (confirmed daniel ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
      (scheduled-any)
      (not (proposed ?s))
    )
  )
)