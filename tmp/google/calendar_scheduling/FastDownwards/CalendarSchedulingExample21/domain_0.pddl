(define (domain combined-meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (next ?s ?s2)

    ;; Agent-specific availability predicates (kept distinct per agent)
    (available-bobby ?s)
    (free-scott ?s)
    (free-kimberly ?s)

    ;; Agent-specific "intent to schedule" predicates (so each agent's action is distinct)
    (bobby-scheduled ?s)
    (scott-scheduled ?s)
    (kimberly-scheduled ?s)

    ;; Final outcome
    (meeting-scheduled)
  )

  ;; Bobby's original scheduling action (kept distinct, uses Bobby's availability predicate)
  (:action bobby-schedule
    :parameters (?s ?s2)
    :precondition (and
      (slot ?s)
      (slot ?s2)
      (next ?s ?s2)
      (available-bobby ?s)
      (available-bobby ?s2)
    )
    :effect (and
      (bobby-scheduled ?s)
      (not (available-bobby ?s))
      (not (available-bobby ?s2))
    )
  )

  ;; Scott's scheduling action (kept distinct, uses Scott's predicate)
  (:action scott-schedule
    :parameters (?s ?s2)
    :precondition (and
      (slot ?s)
      (slot ?s2)
      (next ?s ?s2)
      (free-scott ?s)
      (free-scott ?s2)
    )
    :effect (and
      (scott-scheduled ?s)
      (not (free-scott ?s))
      (not (free-scott ?s2))
    )
  )

  ;; Kimberly's scheduling action (kept distinct, uses Kimberly's predicate)
  (:action kimberly-schedule
    :parameters (?s ?s2)
    :precondition (and
      (slot ?s)
      (slot ?s2)
      (next ?s ?s2)
      (free-kimberly ?s)
      (free-kimberly ?s2)
    )
    :effect (and
      (kimberly-scheduled ?s)
      (not (free-kimberly ?s))
      (not (free-kimberly ?s2))
    )
  )

  ;; Coordinator/finalizer action: only when all three agents have scheduled the same start slot
  ;; will the meeting be considered scheduled for all participants.
  (:action finalize-meeting
    :parameters (?s ?s2)
    :precondition (and
      (slot ?s)
      (slot ?s2)
      (next ?s ?s2)
      (bobby-scheduled ?s)
      (scott-scheduled ?s)
      (kimberly-scheduled ?s)
    )
    :effect (and
      (meeting-scheduled)
    )
  )
)