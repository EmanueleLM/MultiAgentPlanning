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

  ;; attack_agent_attack: requires a province on ?x, a planet marker on ?p, and global harmony.
  ;; Effects: produce pain on ?x, remove province from ?x, remove planet marker from ?p, and remove harmony.
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

  ;; succumb_agent_succumb: requires pain on ?x.
  ;; Effects: restore province and planet to ?x and restore harmony; remove pain from ?x.
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

  ;; overcome_agent_overcome: requires province on ?y and pain on ?x.
  ;; Effects: create harmony, give province to ?x, create craves(?x,?y); remove province from ?y and remove pain from ?x.
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

  ;; feast_agent_feast: requires craves(?x,?y), province on ?x, and harmony.
  ;; Effects: produce pain on ?x, give province to ?y; remove craves(?x,?y), remove province from ?x, and remove harmony.
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