(define (domain harmony-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent province planet)
  (:predicates
    (harmony)
    (pain ?a - agent)
    (craves ?a - agent ?b - agent)
    (owns_province ?a - agent ?p - province)
    (owns_planet ?a - agent ?pl - planet)
    (distinct ?x - agent ?y - agent)
  )

  ;; Attacker's Attack action (prefixed with attacker-)
  (:action attacker-attack
    :parameters (?att - agent ?p - province ?pl - planet)
    :precondition (and
      (owns_province ?att ?p)
      (owns_planet ?att ?pl)
      (harmony)
    )
    :effect (and
      (pain ?att)
      (not (owns_province ?att ?p))
      (not (owns_planet ?att ?pl))
      (not (harmony))
    )
  )

  ;; Overcomer Overcome action (prefixed with overcomer-)
  (:action overcomer-overcome
    :parameters (?winner - agent ?loser - agent ?p - province)
    :precondition (and
      (owns_province ?loser ?p)
      (pain ?winner)
      (distinct ?winner ?loser)
    )
    :effect (and
      (harmony)
      (owns_province ?winner ?p)
      (craves ?winner ?loser)
      (not (owns_province ?loser ?p))
      (not (pain ?winner))
    )
  )

  ;; Feaster Feast action (prefixed with feaster-)
  ;; Feast consumes a craves relation held by eater, transfers eater's province to target,
  ;; produces pain on the eater, and removes harmony.
  (:action feaster-feast
    :parameters (?eater - agent ?target - agent ?p - province)
    :precondition (and
      (craves ?eater ?target)
      (owns_province ?eater ?p)
      (harmony)
      (distinct ?eater ?target)
    )
    :effect (and
      (pain ?eater)
      (owns_province ?target ?p)
      (not (craves ?eater ?target))
      (not (owns_province ?eater ?p))
      (not (harmony))
    )
  )

  ;; Succumb action (prefixed with suc-)
  ;; Succumb consumes pain for an agent and restores a province, a planet and harmony.
  (:action suc-succumb
    :parameters (?ag - agent ?p - province ?pl - planet)
    :precondition (and
      (pain ?ag)
    )
    :effect (and
      (owns_province ?ag ?p)
      (owns_planet ?ag ?pl)
      (harmony)
      (not (pain ?ag))
    )
  )
)