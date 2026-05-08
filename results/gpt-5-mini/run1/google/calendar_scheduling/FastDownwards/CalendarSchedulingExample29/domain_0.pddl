(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)

  (:predicates
    ;; availability facts (one predicate per participant per slot)
    (available-madison ?s - slot)
    (available-diana ?s - slot)
    (available-shirley ?s - slot)

    ;; adjacency/ordering of half-hour slots
    (successor ?s1 - slot ?s2 - slot)

    ;; per-participant confirmations for a particular contiguous pair
    (confirmed-madison ?s1 - slot ?s2 - slot)
    (confirmed-diana ?s1 - slot ?s2 - slot)
    (confirmed-shirley ?s1 - slot ?s2 - slot)

    ;; occupancy and final meeting marker
    (occupied ?s - slot)
    (meeting-established)
  )

  ;; Each participant has a distinct confirmation action. Confirms require that the two slots
  ;; are successor (contiguous), that the participant is available in both slots, and that
  ;; neither slot is already occupied. Effects: record confirmation.
  (:action confirm-madison
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (successor ?s1 ?s2)
      (available-madison ?s1)
      (available-madison ?s2)
      (not (occupied ?s1))
      (not (occupied ?s2))
    )
    :effect (and
      (confirmed-madison ?s1 ?s2)
    )
  )

  (:action confirm-diana
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (successor ?s1 ?s2)
      (available-diana ?s1)
      (available-diana ?s2)
      (not (occupied ?s1))
      (not (occupied ?s2))
    )
    :effect (and
      (confirmed-diana ?s1 ?s2)
    )
  )

  (:action confirm-shirley
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (successor ?s1 ?s2)
      (available-shirley ?s1)
      (available-shirley ?s2)
      (not (occupied ?s1))
      (not (occupied ?s2))
    )
    :effect (and
      (confirmed-shirley ?s1 ?s2)
    )
  )

  ;; Finalize the meeting. This action enforces that all three participants have
  ;; confirmed the same contiguous pair. It marks both slots occupied and establishes the meeting.
  ;; The (not (meeting-established)) precondition prevents re-establishing after done.
  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (successor ?s1 ?s2)
      (confirmed-madison ?s1 ?s2)
      (confirmed-diana ?s1 ?s2)
      (confirmed-shirley ?s1 ?s2)
      (not (meeting-established))
    )
    :effect (and
      (meeting-established)
      (occupied ?s1)
      (occupied ?s2)
    )
  )
)