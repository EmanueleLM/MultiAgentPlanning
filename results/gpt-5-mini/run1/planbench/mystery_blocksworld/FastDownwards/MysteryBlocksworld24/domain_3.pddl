(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; attacker action: consumes province, planet and harmony on the same object,
  ;; produces pain for that object and removes province, planet, harmony.
  (:action attacker-attack
    :parameters (?o - obj)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                  )
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
            )
  )

  ;; succumber action: requires pain on the object; restores province, planet, harmony and removes pain.
  (:action succumber-succumb
    :parameters (?o - obj)
    :precondition (and
                    (pain ?o)
                  )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
            )
  )

  ;; overcomer action: requires another object to be a province and requires pain on the actor.
  ;; Produces harmony, makes the actor a province and creates a craves relation actor->other.
  ;; Removes province status from the other object and removes pain from the actor.
  (:action overcomer-overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
                    (province ?other)
                    (pain ?o)
                  )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain ?o))
            )
  )

  ;; feaster action: requires a craves relation actor->meal, province on actor, and harmony.
  ;; Produces pain on actor and province on meal; removes the craves relation, actor's province, and harmony.
  (:action feaster-feast
    :parameters (?craver - obj ?meal - obj)
    :precondition (and
                    (craves ?craver ?meal)
                    (province ?craver)
                    (harmony)
                  )
    :effect (and
              (pain ?craver)
              (province ?meal)
              (not (craves ?craver ?meal))
              (not (province ?craver))
              (not (harmony))
            )
  )
)