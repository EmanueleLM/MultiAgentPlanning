(define (domain multi-agent-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    ; agent presence at a location at a specific time slot
    (at ?a - agent ?l - location ?t - time)
    ; time succession relation (discrete hourly slots)
    (next ?t1 - time ?t2 - time)
    ; a time slot is available (not already consumed) for an agent
    (free ?a - agent ?t - time)
    ; bookkeeping predicate set when the orchestrator has arrived at Nob Hill at 09:00
    (visited-nobhill-by09)
    ; meeting completion predicate (met Mary for required duration)
    (met-with-mary)
  )

  ; -----------------------
  ; Orchestrator actions
  ; -----------------------

  ; 1-hour move from HQ to Nob Hill (consumes start and arrival time slots)
  (:action orch-move-hq-to-nobhill
    :parameters (?t ?t1 - time)
    :precondition (and
      (at orchestrator hq ?t)
      (next ?t ?t1)
      (free orchestrator ?t)
      (free orchestrator ?t1)
    )
    :effect (and
      (not (at orchestrator hq ?t))
      (at orchestrator nobhill ?t1)
      (not (free orchestrator ?t))
      (not (free orchestrator ?t1))
      ; if arrival is exactly 09:00, mark the visited flag
      (when (and (= ?t1 t09)) (visited-nobhill-by09))
    )
  )

  ; 1-hour move from Nob Hill to Marina District (consumes start and arrival time slots)
  (:action orch-move-nobhill-to-marina
    :parameters (?t ?t1 - time)
    :precondition (and
      (at orchestrator nobhill ?t)
      (next ?t ?t1)
      (free orchestrator ?t)
      (free orchestrator ?t1)
    )
    :effect (and
      (not (at orchestrator nobhill ?t))
      (at orchestrator marina ?t1)
      (not (free orchestrator ?t))
      (not (free orchestrator ?t1))
    )
  )

  ; 2-hour move from Marina District to Nob Hill (consumes start and two intermediate/arrival time slots)
  (:action orch-move-marina-to-nobhill-2h
    :parameters (?t ?t1 ?t2 - time)
    :precondition (and
      (at orchestrator marina ?t)
      (next ?t ?t1)
      (next ?t1 ?t2)
      (free orchestrator ?t)
      (free orchestrator ?t1)
      (free orchestrator ?t2)
    )
    :effect (and
      (not (at orchestrator marina ?t))
      (at orchestrator nobhill ?t2)
      (not (free orchestrator ?t))
      (not (free orchestrator ?t1))
      (not (free orchestrator ?t2))
      ; if arrival is at 09:00 by this two-hour travel, mark visited
      (when (and (= ?t2 t09)) (visited-nobhill-by09))
    )
  )

  ; Stay at same location for one additional hour (consumes the target hour)
  (:action orch-stay-one-hour
    :parameters (?loc - location ?t ?t1 - time)
    :precondition (and
      (at orchestrator ?loc ?t)
      (next ?t ?t1)
      (free orchestrator ?t1)
    )
    :effect (and
      (at orchestrator ?loc ?t1)
      (not (free orchestrator ?t1))
    )
  )

  ; -----------------------
  ; Mary actions / availability
  ; Mary is modelled as mostly stationary and available only in specified slots.
  ; We include a stay action for Mary only to propagate presence if needed (not required by initial encoding)
  ; -----------------------
  (:action mary-stay-one-hour
    :parameters (?loc - location ?t ?t1 - time)
    :precondition (and
      (at mary ?loc ?t)
      (next ?t ?t1)
      (free mary ?t1)
    )
    :effect (and
      (at mary ?loc ?t1)
      (not (free mary ?t1))
    )
  )

  ; -----------------------
  ; Meeting action
  ; Must meet Mary for at least 120 minutes between 20:00 and 22:00.
  ; Enforce: meeting occupies BOTH hour slots t20 and t21 (each 60-minute discrete slots)
  ; Meeting requires both agents to be co-located at those two time slots,
  ; the corresponding time slots must be free for both agents, and the orchestrator
  ; must have visited Nob Hill at 09:00 earlier (visited-nobhill-by09).
  ; The action consumes both agents' t20 and t21 free slots and asserts met-with-mary.
  ; -----------------------
  (:action orch-meet-mary-at-20
    :parameters (?loc - location)
    :precondition (and
      (at orchestrator ?loc t20)
      (at mary ?loc t20)
      (at orchestrator ?loc t21)
      (at mary ?loc t21)
      (free orchestrator t20)
      (free orchestrator t21)
      (free mary t20)
      (free mary t21)
      (visited-nobhill-by09)
    )
    :effect (and
      (met-with-mary)
      (not (free orchestrator t20))
      (not (free orchestrator t21))
      (not (free mary t20))
      (not (free mary t21))
    )
  )

)