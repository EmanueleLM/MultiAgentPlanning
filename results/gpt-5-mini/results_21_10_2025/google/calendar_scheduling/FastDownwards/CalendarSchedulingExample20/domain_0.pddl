(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (available ?p - participant ?s - slot)   ; participant is available at slot
    (proposed ?s - slot)                     ; a slot has been proposed
    (confirmed ?p - participant ?s - slot)   ; participant confirmed the proposed slot
    (scheduled ?s - slot)                    ; final scheduled slot
  )

  ;; System proposes a candidate slot
  (:action propose-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (proposed ?s))
      (not (scheduled ?s))
    )
    :effect (and
      (proposed ?s)
    )
  )

  ;; Ralph confirms a proposed slot (action kept distinct per participant)
  (:action ralph-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available ralph ?s)
      (not (confirmed ralph ?s))
    )
    :effect (and
      (confirmed ralph ?s)
    )
  )

  ;; Peter confirms a proposed slot
  (:action peter-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available peter ?s)
      (not (confirmed peter ?s))
    )
    :effect (and
      (confirmed peter ?s)
    )
  )

  ;; Daniel confirms a proposed slot
  ;; Daniel's natural-language preference (avoid meetings after 13:30) is enforced as a hard constraint:
  ;; he will only be marked available in the problem for slots that start at or before 13:00.
  (:action daniel-confirm
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (available daniel ?s)
      (not (confirmed daniel ?s))
    )
    :effect (and
      (confirmed daniel ?s)
    )
  )

  ;; Finalize scheduling once all participants have confirmed
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
      (not (proposed ?s))
    )
  )
)