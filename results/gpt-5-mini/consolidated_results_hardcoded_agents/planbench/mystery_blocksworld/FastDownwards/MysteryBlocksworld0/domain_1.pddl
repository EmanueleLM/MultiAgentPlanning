(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain)
    (craves ?x - obj ?y - obj)
    (curr ?s - stage)                    ;; current discrete stage
    (succ ?s1 - stage ?s2 - stage)       ;; stage ordering (static)
  )

  ;; All actions advance the global discrete stage from ?s to its successor ?s2.
  ;; This enforces ordered stages and prevents oscillation by disallowing actions
  ;; that return the current stage to a prior stage.

  (:action agent_attack
    :parameters (?attacker - obj ?target - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (curr ?s)
                    (succ ?s ?s2)
                    (province ?attacker)
                    (planet ?target)
                    (harmony)
                  )
    :effect (and
              (not (curr ?s))
              (curr ?s2)
              (not (province ?attacker))
              (not (planet ?target))
              (not (harmony))
              (pain)
            )
  )

  (:action agent_feast
    :parameters (?consumer - obj ?prey - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (curr ?s)
                    (succ ?s ?s2)
                    (craves ?consumer ?prey)
                    (province ?consumer)
                    (harmony)
                  )
    :effect (and
              (not (curr ?s))
              (curr ?s2)
              (pain)
              (province ?prey)
              (not (craves ?consumer ?prey))
              (not (province ?consumer))
              (not (harmony))
            )
  )

  (:action agent_succumb
    :parameters (?recipient - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (curr ?s)
                    (succ ?s ?s2)
                    (pain)
                  )
    :effect (and
              (not (curr ?s))
              (curr ?s2)
              (province ?recipient)
              (planet ?recipient)
              (harmony)
              (not (pain))
            )
  )

  (:action agent_overcome
    :parameters (?winner - obj ?loser - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (curr ?s)
                    (succ ?s ?s2)
                    (province ?loser)
                    (pain)
                  )
    :effect (and
              (not (curr ?s))
              (curr ?s2)
              (harmony)
              (province ?winner)
              (craves ?winner ?loser)
              (not (province ?loser))
              (not (pain))
            )
  )
)