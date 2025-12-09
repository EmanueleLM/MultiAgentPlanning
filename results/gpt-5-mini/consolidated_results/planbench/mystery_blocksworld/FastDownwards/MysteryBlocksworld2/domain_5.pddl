(define (domain mystery-craving)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (different ?x - object ?y - object)

    ;; Discrete temporal progression: single active stage that must be advanced by every action.
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Attack: requires attacker to hold province, target to be a planet, and global harmony.
  ;; Produces pain on the target, removes province from attacker, removes planet from target,
  ;; and destroys harmony. Advances the global stage.
  (:action attack
    :parameters (?attacker - object ?target - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (province ?attacker)
      (planet ?target)
      (harmony)
      (different ?attacker ?target)
      (at-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (pain ?target)
      (not (province ?attacker))
      (not (planet ?target))
      (not (harmony))
      (not (at-stage ?s1))
      (at-stage ?s2)
    )
  )

  ;; Succumb: requires the victim to be in pain. A 'by' object receives province; the victim becomes a planet again.
  ;; Restores harmony and removes pain from the victim. Advances the stage.
  (:action succumb
    :parameters (?victim - object ?by - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (pain ?victim)
      (different ?victim ?by)
      (at-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (province ?by)
      (planet ?victim)
      (harmony)
      (not (pain ?victim))
      (not (at-stage ?s1))
      (at-stage ?s2)
    )
  )

  ;; Overcome: requires that some other object currently has province and that actor is in pain.
  ;; Produces harmony, gives province to actor, makes actor crave the other, and removes province from other and pain from actor.
  ;; Advances the stage.
  (:action overcome
    :parameters (?actor - object ?other - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (province ?other)
      (pain ?actor)
      (different ?actor ?other)
      (at-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain ?actor))
      (not (at-stage ?s1))
      (at-stage ?s2)
    )
  )

  ;; Feast: requires that actor craves other, actor has province, and harmony holds.
  ;; Produces pain on actor and gives province to the other object. Removes the craves relation, the actor's province, and harmony.
  ;; Advances the stage.
  (:action feast
    :parameters (?actor - object ?other - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
      (different ?actor ?other)
      (at-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (not (at-stage ?s1))
      (at-stage ?s2)
    )
  )
)