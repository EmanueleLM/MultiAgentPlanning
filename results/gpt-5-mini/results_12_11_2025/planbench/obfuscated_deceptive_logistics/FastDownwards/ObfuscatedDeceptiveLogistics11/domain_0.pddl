(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item location phase)

  (:predicates
    ;; Roles
    (role-observer ?a - agent)
    (role-executor ?a - agent)
    (role-auditor ?a - agent)

    ;; Positions
    (agent-at ?a - agent ?l - location)
    (item-at ?i - item ?l - location)

    ;; Item states
    (inventoried ?i - item)
    (processed ?i - item)
    (verified ?i - item)

    ;; Phases and ordering
    (phase ?p - phase)
    (current-phase ?p - phase)
    (next ?p - phase ?q - phase)
  )

  ;; Observer action: record an inventory entry for an item; only in phase p1
  (:action inventory-by-observer
    :parameters (?obs - agent ?it - item ?loc - location)
    :precondition (and
      (role-observer ?obs)
      (agent-at ?obs ?loc)
      (item-at ?it ?loc)
      (current-phase p1)
      (not (inventoried ?it))
    )
    :effect (and
      (inventoried ?it)
    )
  )

  ;; Executor action: process an inventoried item; only in phase p2
  (:action process-by-executor
    :parameters (?exe - agent ?it - item ?loc - location)
    :precondition (and
      (role-executor ?exe)
      (agent-at ?exe ?loc)
      (item-at ?it ?loc)
      (inventoried ?it)
      (current-phase p2)
      (not (processed ?it))
    )
    :effect (and
      (processed ?it)
    )
  )

  ;; Auditor action: verify a processed item; only in phase p3
  (:action verify-by-auditor
    :parameters (?aud - agent ?it - item ?loc - location)
    :precondition (and
      (role-auditor ?aud)
      (agent-at ?aud ?loc)
      (item-at ?it ?loc)
      (processed ?it)
      (current-phase p3)
      (not (verified ?it))
    )
    :effect (and
      (verified ?it)
    )
  )

  ;; Advance phase from p1 to p2: only allowed when all items are inventoried
  (:action advance-phase-1-to-2
    :parameters (?obs - agent)
    :precondition (and
      (role-observer ?obs)
      (current-phase p1)
      ;; hard constraints: every item must be inventoried before advancing
      (inventoried item1)
      (inventoried item2)
    )
    :effect (and
      (not (current-phase p1))
      (current-phase p2)
    )
  )

  ;; Advance phase from p2 to p3: only allowed when all items are processed
  (:action advance-phase-2-to-3
    :parameters (?obs - agent)
    :precondition (and
      (role-observer ?obs)
      (current-phase p2)
      ;; hard constraints: every item must be processed before advancing
      (processed item1)
      (processed item2)
    )
    :effect (and
      (not (current-phase p2))
      (current-phase p3)
    )
  )

  ;; (Optional) A single action to move an agent between locations if needed.
  ;; Movement is allowed at any phase but is explicit so agents must be at the item location to act.
  (:action move-agent
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (agent-at ?a ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (agent-at ?a ?from))
      (agent-at ?a ?to)
    )
  )

)