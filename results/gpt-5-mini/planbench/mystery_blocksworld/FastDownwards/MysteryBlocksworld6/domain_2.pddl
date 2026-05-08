(define (domain mystery_blocksworld6)
  (:requirements :strips :typing)
  (:types item)

  (:predicates
    (province ?x - item)
    (planet ?x - item)
    (harmony)
    (pain ?x - item)
    (craves ?x - item ?y - item)
  )

  ;; Attack: requires that the same object is both a province and a planet,
  ;; and global harmony holds. Produces pain for that object and removes
  ;; its province/planet status and global harmony.
  (:action attack
    :parameters (?x - item)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
              (pain ?x)
              (not (province ?x))
              (not (planet ?x))
              (not (harmony))
            )
  )

  ;; Succumb: requires that the object is in pain. Restores province and planet
  ;; for that object and global harmony; removes pain.
  (:action succumb
    :parameters (?x - item)
    :precondition (and (pain ?x))
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))
            )
  )

  ;; Overcome: requires some other object ?y to have province and the acting
  ;; object ?x to be in pain. Produces harmony, gives province to ?x and makes
  ;; ?x crave ?y. Removes province from ?y and removes pain from ?x.
  (:action overcome
    :parameters (?x - item ?y - item)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
              (harmony)
              (province ?x)
              (craves ?x ?y)
              (not (province ?y))
              (not (pain ?x))
            )
  )

  ;; Feast: requires that ?x craves ?y, ?x has province, and harmony holds.
  ;; Produces pain on ?x and gives province to ?y. Removes the craves relation,
  ;; removes province from ?x and removes harmony.
  (:action feast
    :parameters (?x - item ?y - item)
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