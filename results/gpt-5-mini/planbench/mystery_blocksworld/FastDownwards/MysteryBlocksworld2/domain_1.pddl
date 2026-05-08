(define (domain mystery_blocksworld2)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack: requires a province-holder and a planet, and global harmony.
  ;; Produces pain on the province-holder and removes that province, the planet fact, and harmony.
  (:action attack
    :parameters (?p - obj ?pl - obj)
    :precondition (and
      (province ?p)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain ?p)
      (not (province ?p))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb: a specific object that has pain may succumb.
  ;; Restores province to that object, sets a planet fact for a (possibly different) object, restores harmony,
  ;; and clears that object's pain.
  (:action succumb
    :parameters (?x - obj ?pl - obj)
    :precondition (and
      (pain ?x)
    )
    :effect (and
      (province ?x)
      (planet ?pl)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome: an object with pain may overcome another object that currently holds province.
  ;; This gives harmony, transfers province to the formerly-pained object, creates a craves relation
  ;; from the former-pained object to the former-province object, and removes the old province and the pain.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?y)
      (pain ?x)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast: subject x that craves y, and that currently holds province and harmony, may feast on y.
  ;; This produces pain on x, gives province to y, and removes the craves, the province of x and harmony.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)