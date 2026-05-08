(define (domain mystery_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?who - obj ?what - obj)
    (pain ?o - obj)
    (harmony)
    (planet ?o - obj)
    (province ?o - obj)
  )

  ;; Attack: requires a province (for the first parameter), a planet (for the second parameter),
  ;; and global harmony. Produces pain on the first parameter and removes the province of that
  ;; object, the planet marker on the second object, and global harmony.
  (:action attack_agent_attack
    :parameters (?x - obj ?p - obj)
    :precondition (and (province ?x) (planet ?p) (harmony))
    :effect (and
              (pain ?x)
              (not (province ?x))
              (not (planet ?p))
              (not (harmony))
            )
  )

  ;; Succumb: requires pain on an object. Restores that object's province and planet and restores harmony.
  (:action succumb_agent_succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x))
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))
            )
  )

  ;; Overcome: requires that the 'other' object (second parameter) has a province and the first object is in pain.
  ;; It creates harmony, gives the first object a province, and makes the first object crave the second.
  ;; It removes the province from the second object and clears pain from the first object.
  (:action overcome_agent_overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
              (harmony)
              (province ?x)
              (craves ?x ?y)
              (not (province ?y))
              (not (pain ?x))
            )
  )

  ;; Feast: requires a craves relation from the first object to the second, a province on the first, and harmony.
  ;; It produces pain on the first and gives a province to the second; it removes the craving, the first's province, and harmony.
  (:action feast_agent_feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
              (pain ?x)
              (province ?y)
              (not (craves ?x ?y))
              (not (province ?x))
              (not (harmony))
            )
  )
)