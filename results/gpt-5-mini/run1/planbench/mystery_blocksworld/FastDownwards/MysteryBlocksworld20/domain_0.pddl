(define (domain province-feast)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Modeling notes (non-obvious choices)
  ; - We include explicit unary type-assertion predicates (is-agent, is-object)
  ;   because the reconciled schemas required explicit "type existence"
  ;   preconditions in addition to typed parameters.
  ; - Inequality constraints (?x != ?y) are modeled with an explicit
  ;   binary predicate (different ?x ?y). The problem file must assert
  ;   all (different X Y) facts for every ordered pair of distinct objects
  ;   to enforce inequality without relying on :equality.
  ; - The Attack action is explicitly prefixed with the agent role
  ;   (attacker-attack) and requires an Agent-typed performer as specified.
  ; - All actions are modeled as atomic STRIPS-like actions: preconditions
  ;   are tested at start, and all listed add/delete effects take effect
  ;   together at the action end. This enforces simultaneous province
  ;   transfers (no intermediate states where both/none hold unless the
  ;   domain semantics permit this).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:predicates
    (is-agent ?a - agent)
    (is-object ?o - object)

    (province ?o - object)
    (planet ?o - object)

    (craves ?s - object ?o - object)

    (harmony)
    (pain)

    (different ?o1 - object ?o2 - object)
  )

  ; attacker-attack: performed by an Agent on a province and a planet.
  (:action attacker-attack
    :parameters (?attacker - agent ?prov - object ?pl - object)
    :precondition (and
      (is-agent ?attacker)
      (is-object ?prov) (is-object ?pl)
      (province ?prov)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ; succumb: global transition, no performer required (as reconciled).
  (:action succumb
    :parameters (?prov - object ?pl - object)
    :precondition (and
      (is-object ?prov) (is-object ?pl)
      (pain)
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
    )
  )

  ; overcome: subject ?x gains Province, craves ?y; consumes Province(?y) and Pain.
  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (is-object ?x) (is-object ?y)
      (different ?x ?y)
      (province ?y)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ; feast: feaster consumes prey; transfer of Province is atomic; self-feasting disallowed.
  (:action feast
    :parameters (?feaster - object ?prey - object)
    :precondition (and
      (is-object ?feaster) (is-object ?prey)
      (different ?feaster ?prey)
      (craves ?feaster ?prey)
      (province ?feaster)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?prey)
      (not (craves ?feaster ?prey))
      (not (province ?feaster))
      (not (harmony))
    )
  )
)