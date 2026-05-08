(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item)

  (:predicates
    ;; role/type markers
    (is-orchestrator ?a - agent)
    (is-advertiser ?a - agent)
    (is-consumer ?a - agent)

    ;; world facts
    (item-exists ?i - item)

    ;; ordering / progress predicates (enforce sequence)
    (instructed ?adv - agent ?i - item)
    (advertised ?i - item)
    (perceived ?c - agent ?i - item)
    (craves ?c - agent ?i - item)
  )

  ;; Orchestrator instructs a specific advertiser about a specific item.
  ;; Only an agent marked as orchestrator may perform this action.
  (:action instruct-advertiser
    :parameters (?orch - agent ?adv - agent ?i - item)
    :precondition (and
                    (is-orchestrator ?orch)
                    (is-advertiser ?adv)
                    (item-exists ?i)
                    (not (instructed ?adv ?i))
                  )
    :effect (and
              (instructed ?adv ?i)
            )
  )

  ;; Advertiser advertises the item ONLY after being instructed about it.
  ;; This ensures advertise cannot happen before instruction.
  (:action advertise-item
    :parameters (?adv - agent ?i - item)
    :precondition (and
                    (is-advertiser ?adv)
                    (instructed ?adv ?i)
                    (not (advertised ?i))
                  )
    :effect (and
              (advertised ?i)
            )
  )

  ;; Consumer perceives the item only after it has been advertised.
  ;; This enforces that perception follows advertise.
  (:action perceive-item
    :parameters (?c - agent ?i - item)
    :precondition (and
                    (is-consumer ?c)
                    (advertised ?i)
                    (not (perceived ?c ?i))
                  )
    :effect (and
              (perceived ?c ?i)
            )
  )

  ;; Consumer forms a craving only after perceiving the item.
  ;; This enforces the final step and prevents bypassing perception.
  (:action form-craving
    :parameters (?c - agent ?i - item)
    :precondition (and
                    (is-consumer ?c)
                    (perceived ?c ?i)
                    (not (craves ?c ?i))
                  )
    :effect (and
              (craves ?c ?i)
            )
  )
)