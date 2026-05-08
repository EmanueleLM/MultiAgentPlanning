(define (domain harmony-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x ?y - obj)
  )

  ;; Attack: requires the object to be both a province and a planet and global harmony.
  ;; Effects: the object acquires pain, and loses its province and planet; global harmony is removed.
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

  ;; Succumb: requires pain on the object.
  ;; Effects: restores province, planet, and global harmony to that object; removes its pain.
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

  ;; Overcome: requires the actor to have pain and the other to hold a province.
  ;; Effects: actor gains harmony, gains the province, and begins to crave the other; the other's province and the actor's pain are removed.
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

  ;; Feast: requires the actor to crave the other, the actor to hold a province, and global harmony.
  ;; Effects: the actor acquires pain, the other gains the province; the craving, the actor's province, and global harmony are removed.
  (:action Feast
    :parameters (?actor - obj ?other - obj)
    :precondition (and (craves ?actor ?other) (province ?actor) (harmony))
    :effect (and
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
    )
  )
)