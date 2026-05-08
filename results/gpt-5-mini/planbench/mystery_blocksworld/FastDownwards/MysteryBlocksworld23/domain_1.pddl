(define (domain mystery-blocksworld23)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
  )

  ;; Attack: requires the object to be a province and a planet, and harmony.
  ;; Effects: produces pain and removes province, planet, and harmony.
  (:action attack
    :parameters (?o - object)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
              (pain)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
            )
  )

  ;; Succumb: requires pain.
  ;; Effects: restores province and planet for the chosen object and harmony; removes pain.
  (:action succumb
    :parameters (?o - object)
    :precondition (and (pain))
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain))
            )
  )

  ;; Overcome: requires the "other" object to hold a province and global pain.
  ;; Effects: creates harmony, gives province to the first object, makes it crave the other,
  ;; and removes the other's province and the pain token.
  (:action overcome
    :parameters (?o - object ?other - object)
    :precondition (and (province ?other) (pain))
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain))
            )
  )

  ;; Feast: requires that ?o craves ?other, that ?o has a province, and harmony.
  ;; Effects: produces pain, transfers province to ?other, and removes the craving, the province of ?o, and harmony.
  (:action feast
    :parameters (?o - object ?other - object)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
              (pain)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
            )
  )
)