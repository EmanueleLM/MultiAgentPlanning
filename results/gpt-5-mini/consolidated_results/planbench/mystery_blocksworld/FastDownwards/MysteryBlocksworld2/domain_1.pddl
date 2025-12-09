(define (domain mystery-craving)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
  )

  ;; Attack ?attacker ?target
  ;; Preconditions: province ?attacker, planet ?target, harmony
  ;; Effects: target is put in pain; remove province from attacker; remove planet from target; remove harmony
  (:action attack
    :parameters (?attacker - object ?target - object)
    :precondition (and
      (province ?attacker)
      (planet ?target)
      (harmony)
    )
    :effect (and
      (pain ?target)
      (not (province ?attacker))
      (not (planet ?target))
      (not (harmony))
    )
  )

  ;; Succumb ?victim ?by
  ;; Preconditions: pain on victim
  ;; Effects: give province to the by-actor, give planet to the victim, restore harmony, remove pain from victim
  (:action succumb
    :parameters (?victim - object ?by - object)
    :precondition (and
      (pain ?victim)
    )
    :effect (and
      (province ?by)
      (planet ?victim)
      (harmony)
      (not (pain ?victim))
    )
  )

  ;; Overcome ?actor ?other
  ;; Preconditions: province on other, pain on actor
  ;; Effects: restore harmony, give province to actor, actor craves other, remove province from other, remove pain from actor
  (:action overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?actor)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain ?actor))
    )
  )

  ;; Feast ?actor ?other
  ;; Preconditions: actor craves other, actor has province, harmony
  ;; Effects: actor gets pain, other gets province, remove craves(actor,other), remove province(actor), remove harmony
  (:action feast
    :parameters (?actor - object ?other - object)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
    )
    :effect (and
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
    )
  )
)