(define (domain province-feast)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Modeling notes:
  ; - Actions are namespaced per role: attacker-attack, succumber-succumb,
  ;   overcomer-overcome, feaster-feast to reflect the multi-agent modeling.
  ; - We keep a small explicit predicate set: province, planet, craves, harmony,
  ;   pain, and an explicit different predicate to enforce inequality where needed.
  ; - All actions are atomic STRIPS actions; preconditions are evaluated before
  ;   the action and effects are applied simultaneously.
  ; - Inequality is modeled by the binary predicate (different ?x ?y).
  ;   The problem must assert (different X Y) for every ordered pair X != Y.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:predicates
    (province ?o - object)
    (planet ?o - object)

    (craves ?s - object ?o - object)

    (harmony)
    (pain)

    (different ?o1 - object ?o2 - object)
  )

  ; attacker-attack: requires a province and a planet (may be the same object).
  ; Effects: pain becomes true; the supplied province and planet facts and harmony
  ; are removed.
  (:action attacker-attack
    :parameters (?attacker - agent ?prov - object ?pl - object)
    :precondition (and
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

  ; succumber-succumb: consumes pain and restores a chosen province and planet and harmony.
  (:action succumber-succumb
    :parameters (?prov - object ?pl - object)
    :precondition (and
      (pain)
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
    )
  )

  ; overcomer-overcome: requires that ?other currently holds province and pain is true.
  ; Effects: harmony becomes true, province granted to ?x, ?x craves ?other.
  ; Consumes the province status of ?other and pain.
  (:action overcomer-overcome
    :parameters (?x - object ?other - object)
    :precondition (and
      (different ?x ?other)
      (province ?other)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain))
    )
  )

  ; feaster-feast: requires that ?feaster craves ?prey, ?feaster has province and harmony.
  ; Effects: pain becomes true; province is transferred to the prey; the craving,
  ; the feaster's province and harmony are removed.
  (:action feaster-feast
    :parameters (?feaster - object ?prey - object)
    :precondition (and
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