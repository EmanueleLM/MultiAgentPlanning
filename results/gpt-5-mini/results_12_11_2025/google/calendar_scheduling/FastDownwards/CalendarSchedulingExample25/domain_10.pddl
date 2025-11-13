(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot segment)

  (:predicates
    (available ?p - participant ?s - segment)
    (covers ?sl - slot ?s - segment)
    (next ?s1 - segment ?s2 - segment)
    (chosen ?sl - slot)
    (scheduled)
  )

  ;; Action to schedule a slot that is composed of two contiguous segments.
  ;; Preconditions ensure the slot covers two contiguous segments and that
  ;; each named participant is available on both segments. Negative precondition
  ;; prevents re-selection of an already chosen slot.
  (:action schedule_slot
    :parameters (?sl - slot ?s1 - segment ?s2 - segment)
    :precondition (and
      (covers ?sl ?s1)
      (covers ?sl ?s2)
      (next ?s1 ?s2)
      (not (chosen ?sl))

      ;; Hard requirement: all participants must be available on both segments.
      (available anthony ?s1)
      (available anthony ?s2)
      (available pamela ?s1)
      (available pamela ?s2)
      (available zachary ?s1)
      (available zachary ?s2)
    )
    :effect (and
      (chosen ?sl)
      (scheduled)
    )
  )
)