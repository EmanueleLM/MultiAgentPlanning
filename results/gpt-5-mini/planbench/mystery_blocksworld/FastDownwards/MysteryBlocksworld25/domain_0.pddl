(define (domain conquest)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent province planet)

  (:predicates
    ;; core named predicates (typed)
    (craves ?x - agent ?y - agent)
    (province ?p - province)
    (planet ?pl - planet)
    (harmony ?pl - planet)
    (pain ?ag - agent)

    ;; location and territorial relations
    (located ?ag - agent ?p - province)
    (province-on ?p - province ?pl - planet)
    (controls ?ag - agent ?p - province)

    ;; ordered-sequence / phase predicates (include province tie to prevent reordering)
    (attacked ?attacker - agent ?target - agent ?p - province)
    (succumbed ?target - agent ?attacker - agent ?p - province)
    (overcame ?attacker - agent ?target - agent ?p - province)
    (feasted ?attacker - agent ?target - agent ?p - province)

    ;; helper predicate to enforce agents are distinct (no self-attack)
    (distinct ?a - agent ?b - agent)
  )

  ;; Attack: start the ordered sequence for a specific province & planet
  (:action Attack
    :parameters (?attacker - agent ?target - agent ?p - province ?pl - planet)
    :precondition (and
      (province ?p)
      (planet ?pl)
      (province-on ?p ?pl)
      (located ?attacker ?p)
      (located ?target ?p)
      (not (harmony ?pl))
      (distinct ?attacker ?target)
      (not (attacked ?attacker ?target ?p))
    )
    :effect (and
      (attacked ?attacker ?target ?p)
      (pain ?target)
      (controls ?attacker ?p)
      (not (controls ?target ?p))
    )
  )

  ;; Succumb: must follow an Attack on the same province
  (:action Succumb
    :parameters (?attacker - agent ?target - agent ?p - province ?pl - planet)
    :precondition (and
      (attacked ?attacker ?target ?p)
      (pain ?target)
      (province-on ?p ?pl)
      (distinct ?attacker ?target)
      (not (succumbed ?target ?attacker ?p))
    )
    :effect (and
      (succumbed ?target ?attacker ?p)
      (not (pain ?target))
    )
  )

  ;; Overcome: attacker consolidates after target has succumbed for the same province
  (:action Overcome
    :parameters (?attacker - agent ?target - agent ?p - province ?pl - planet)
    :precondition (and
      (succumbed ?target ?attacker ?p)
      (controls ?attacker ?p)
      (province-on ?p ?pl)
      (distinct ?attacker ?target)
      (not (overcame ?attacker ?target ?p))
    )
    :effect (and
      (overcame ?attacker ?target ?p)
    )
  )

  ;; Feast: terminal step that generates craving; must follow Overcome on same province
  (:action Feast
    :parameters (?attacker - agent ?target - agent ?p - province ?pl - planet)
    :precondition (and
      (overcame ?attacker ?target ?p)
      (province-on ?p ?pl)
      (distinct ?attacker ?target)
      (not (feasted ?attacker ?target ?p))
    )
    :effect (and
      (feasted ?attacker ?target ?p)
      (craves ?attacker ?target)
    )
  )
)