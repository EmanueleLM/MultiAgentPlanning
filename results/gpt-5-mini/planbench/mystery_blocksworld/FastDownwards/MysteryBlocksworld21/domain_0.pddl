(define (domain orchestrator)
  (:requirements :strips :typing)
  (:types entity)
  (:predicates
    (province ?x - entity)
    (planet ?x - entity)
    (harmony)
    (pain ?x - entity)
    (craves ?x ?y - entity)
  )

  ;; Attack: province attacker attacks planet target while harmony holds.
  ;; Effects: target is put in pain, target loses planet status, harmony is broken.
  (:action attack
    :parameters (?attacker - entity ?target - entity)
    :precondition (and (province ?attacker) (planet ?target) (harmony))
    :effect (and
      (pain ?target)
      (not (harmony))
      (not (planet ?target))
    )
  )

  ;; Succumb: an entity in pain resolves pain and becomes both a province and a planet; restores harmony.
  (:action succumb
    :parameters (?x - entity)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome: an entity in pain recovers, becomes a province, forms a craving toward an existing province; restores harmony.
  (:action overcome
    :parameters (?x - entity ?other - entity)
    :precondition (and (pain ?x) (province ?other))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (pain ?x))
    )
  )

  ;; Feast: a provincial feeder that currently craves another consumes that craving while harmony holds.
  ;; Effects: the craving is consumed, feeder loses province status, harmony is broken, the target gains pain.
  (:action feast
    :parameters (?x - entity ?other - entity)
    :precondition (and (craves ?x ?other) (province ?x) (harmony))
    :effect (and
      (pain ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
    )
  )
)