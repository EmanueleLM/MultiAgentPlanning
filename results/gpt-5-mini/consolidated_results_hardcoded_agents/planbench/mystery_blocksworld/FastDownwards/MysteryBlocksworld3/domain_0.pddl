(define (domain harmony-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x ?y - obj)
  )

  ;; Attack: object must be both province and planet and global harmony holds.
  ;; Produces a localized pain for the object and removes its province/planet and global harmony.
  (:action Attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: the same object that has pain can regain province/planet and global harmony.
  (:action Succumb
    :parameters (?o - obj)
    :precondition (and (pain ?o))
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome: an object that has pain can seize province from other_object (which must currently hold a province).
  ;; This creates a craves relation and re-establishes harmony; it consumes the object's pain and removes the other's province.
  (:action Overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain ?o))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: actor that craves target and holds a province while harmony is true acts on target.
  ;; This produces pain on the target, transfers the target's province to actor (i.e., deletes target's province and ensures actor has province),
  ;; removes the craves relation, and deletes global harmony.
  (:action Feast
    :parameters (?actor - obj ?target - obj)
    :precondition (and (craves ?actor ?target) (province ?actor) (harmony))
    :effect (and
      (pain ?target)
      (province ?actor)
      (not (craves ?actor ?target))
      (not (province ?target))
      (not (harmony))
    )
  )

)