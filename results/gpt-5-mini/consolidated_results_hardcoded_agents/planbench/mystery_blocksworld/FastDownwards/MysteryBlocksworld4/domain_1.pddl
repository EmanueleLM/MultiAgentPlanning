(define (domain craving-consistent)
  (:requirements :strips :typing :negative-preconditions)
  (:types item stage)

  (:predicates
    (craves ?s - item ?o - item)
    (province ?i - item)
    (planet ?i - item)
    (harmony)
    (pain ?i - item)
    ;; stage and successor to enforce explicit discrete time progression
    (at ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Attack: requires province of the acting object, planet for same object, and harmony.
  ;; Advances time from a stage to its successor, removes province/planet/harmony, and creates pain on same object.
  (:action attack
    :parameters (?obj - item ?t - stage ?t2 - stage)
    :precondition (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Succumb: requires that the object has pain. Restores province, planet, harmony and removes pain.
  ;; Advances time.
  (:action succumb
    :parameters (?obj - item ?t - stage ?t2 - stage)
    :precondition (and
      (pain ?obj)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Overcome: acting object ?actor requires that some other object ?other is a province and that ?actor has pain.
  ;; Effects: sets harmony, gives province to ?actor, creates craves(actor, other), and removes province from other and pain from actor.
  ;; Advances time.
  (:action overcome
    :parameters (?actor - item ?other - item ?t - stage ?t2 - stage)
    :precondition (and
      (province ?other)
      (pain ?actor)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain ?actor))
      (not (at ?t))
      (at ?t2)
    )
  )

  ;; Feast: acting object ?actor requires that actor craves other, that actor has province, and harmony.
  ;; Effects: creates pain on actor, gives province to other, removes the crave, removes actor's province and harmony.
  ;; Advances time.
  (:action feast
    :parameters (?actor - item ?other - item ?t - stage ?t2 - stage)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
      (at ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (not (at ?t))
      (at ?t2)
    )
  )
)