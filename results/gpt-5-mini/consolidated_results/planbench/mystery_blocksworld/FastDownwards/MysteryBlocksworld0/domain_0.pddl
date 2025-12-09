(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain)
    (craves ?x - obj ?y - obj)
  )

  ;; Namespaced actions (prefixed with "agent_") to keep actions distinct
  (:action agent_attack
    :parameters (?attacker - obj ?target - obj)
    :precondition (and (province ?attacker) (planet ?target) (harmony))
    :effect (and
              (not (province ?attacker))
              (not (planet ?target))
              (not (harmony))
              (pain)
            )
  )

  (:action agent_feast
    :parameters (?consumer - obj ?prey - obj)
    :precondition (and (craves ?consumer ?prey) (province ?consumer) (harmony))
    :effect (and
              (pain)
              (province ?prey)
              (not (craves ?consumer ?prey))
              (not (province ?consumer))
              (not (harmony))
            )
  )

  (:action agent_succumb
    :parameters (?recipient - obj)
    :precondition (and (pain))
    :effect (and
              (province ?recipient)
              (planet ?recipient)
              (harmony)
              (not (pain))
            )
  )

  (:action agent_overcome
    :parameters (?winner - obj ?loser - obj)
    :precondition (and (province ?loser) (pain))
    :effect (and
              (harmony)
              (province ?winner)
              (craves ?winner ?loser)
              (not (province ?loser))
              (not (pain))
            )
  )
)