(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (identified ?s - slot)
    (meeting-at ?s - slot)
  )

  ;; Action that identifies a slot as feasible only if every participant is available at that slot.
  (:action identify-slot
    :parameters (?s - slot)
    :precondition (and
      (available rachel ?s)
      (available katherine ?s)
      (available kelly ?s)
      (available cynthia ?s)
      (available anthony ?s)
      (available ryan ?s)
      (available richard ?s)
    )
    :effect (identified ?s)
  )

  ;; Action that assigns the meeting to an already-identified slot.
  (:action assign-slot
    :parameters (?s - slot)
    :precondition (identified ?s)
    :effect (meeting-at ?s)
  )
)