(define (domain cravings-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?from - obj ?to - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (harmony)
  )

  ;; Attack: requires the same object to be both a province and a planet and global harmony.
  ;; Effects: produces pain for that object and removes its province and planet status and global harmony.
  (:action attacker_attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; Succumb: requires pain on an object; restores province, planet and global harmony for that object,
  ;; and removes its pain.
  (:action succumb_succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome: an object ?x that is in pain can overcome another object ?y that currently has province.
  ;; Effects: grants harmony, grants province to ?x, establishes craves ?x ?y; it removes province from ?y and removes pain from ?x.
  (:action overcomer_overcome
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

  ;; Feast: an object ?x that craves ?y, and currently holds province while harmony holds,
  ;; will feast on ?y: this produces pain for ?x and transfers province to ?y; it also consumes the craving and global harmony.
  (:action feaster_feast
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