(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot time)

  (:predicates
    ;; type markers (avoid name clash with types)
    (is-person ?p - person)
    (is-slot ?s - slot)
    (is-time ?t - time)

    ;; mapping from slot to its start time
    (starts-at ?s - slot ?t - time)

    ;; ordering over time points (successor / order predicate)
    (next-time ?t1 - time ?t2 - time)

    ;; marks time points that are within declared work hours (hard constraint)
    (within-work-hours ?t - time)

    ;; slot-level hard availability: intersection of all participants' free slots
    (free-all ?s - slot)

    ;; allowed after resolving soft preferences (only allowed slots are selectable)
    (allowed ?s - slot)

    ;; meeting scheduled terminal facts
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule meeting at a single slot. Enforce slot-to-time mapping and work-hours,
  ;; require the slot to be a validated candidate (free-all) and allowed after soft-resolution,
  ;; and ensure no re-scheduling by requiring meeting not already scheduled.
  (:action schedule-meeting
    :parameters (?s - slot ?t - time)
    :precondition (and
      (is-slot ?s)
      (is-time ?t)
      (starts-at ?s ?t)
      (within-work-hours ?t)
      (free-all ?s)
      (allowed ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)