(define (domain mystery_crave_domain)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (craves ?s - object ?t - object)  ;; directional craving relation
    (province ?o - object)           ;; object has province
    (planet ?o - object)             ;; object is a planet
    (harmony)                        ;; global harmony flag
    (pain)                           ;; global pain flag
  )

  ;; Attack: object must be both a province and a planet and harmony must hold.
  ;; Effects: set global pain, remove the object's province and planet, and remove harmony.
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

  ;; Succumb: requires global pain.
  ;; Effects: restore the specified object's province and planet and restore harmony; remove pain.
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

  ;; Overcome: two-argument action "overcome object from other".
  ;; Requires the other object to have province and global pain.
  ;; Effects: set harmony, give province to the subject, make subject crave the other;
  ;; remove the other's province and clear pain.
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

  ;; Feast: subject feasts from other.
  ;; Requires subject craves other, subject has province, and harmony.
  ;; Effects: set global pain, give province to the other object, remove the craving,
  ;; remove the subject's province, and remove harmony.
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