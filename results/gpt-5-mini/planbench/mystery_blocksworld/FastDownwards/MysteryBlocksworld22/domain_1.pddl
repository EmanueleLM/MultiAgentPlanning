(define (domain mystery_blocksworld22)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack: requires a province and a planet and harmony.
  ;; Effect: produces pain on the province object, removes the province and the planet facts used, and destroys harmony.
  (:action attack_agent_attack
    :parameters (?p - obj ?pl - obj)
    :precondition (and (province ?p) (planet ?pl) (harmony))
    :effect (and (pain ?p)
                 (not (province ?p))
                 (not (planet ?pl))
                 (not (harmony)))
  )

  ;; Succumb: heals a pained object, restoring province and planet on that same object and restoring harmony.
  (:action succumb_agent_succumb
    :parameters (?o - obj)
    :precondition (and (pain ?o))
    :effect (and (province ?o)
                 (planet ?o)
                 (harmony)
                 (not (pain ?o)))
  )

  ;; Overcome: uses a province on some 'other' and pain on 'o' to move province to 'o', create a craving o->other, and restore harmony.
  (:action overcome_agent_overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain ?o))
    :effect (and (harmony)
                 (province ?o)
                 (craves ?o ?other)
                 (not (province ?other))
                 (not (pain ?o)))
  )

  ;; Feast: consumes an existing craving o->other when o holds province and harmony;
  ;; it produces pain on o, transfers province to other, and removes the craving and harmony.
  (:action feast_agent_feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and (pain ?o)
                 (province ?other)
                 (not (craves ?o ?other))
                 (not (province ?o))
                 (not (harmony)))
  )
)