(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (succ ?s1 - slot ?s2 - slot)
    (reserved ?p - person ?s1 - slot ?s2 - slot)
    (meeting_scheduled ?s1 - slot ?s2 - slot)
  )

  ;; Each participant can reserve a contiguous two-slot block (meeting is 60 minutes = two 30-min slots).
  ;; Actions are participant-specific to keep participants distinct as requested.
  (:action reserve_thomas
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available thomas ?s1)
      (available thomas ?s2)
      (not (reserved thomas ?s1 ?s2))
    )
    :effect (and
      (reserved thomas ?s1 ?s2)
    )
  )

  (:action reserve_dylan
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available dylan ?s1)
      (available dylan ?s2)
      (not (reserved dylan ?s1 ?s2))
    )
    :effect (and
      (reserved dylan ?s1 ?s2)
    )
  )

  (:action reserve_jerry
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (available jerry ?s1)
      (available jerry ?s2)
      (not (reserved jerry ?s1 ?s2))
    )
    :effect (and
      (reserved jerry ?s1 ?s2)
    )
  )

  ;; Finalize meeting once all participants have reserved the same contiguous slot pair.
  (:action finalize_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (reserved thomas ?s1 ?s2)
      (reserved dylan ?s1 ?s2)
      (reserved jerry ?s1 ?s2)
      (not (meeting_scheduled ?s1 ?s2))
    )
    :effect (and
      (meeting_scheduled ?s1 ?s2)
    )
  )
)