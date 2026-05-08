(define (domain mystery_blocksworld_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack: requires an object that is both a province and a planet and global harmony.
  ;; Effects: that object becomes in pain; it ceases to be a province and a planet; global harmony is lost.
  (:action attacker_attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x)
                 (not (province ?x))
                 (not (planet ?x))
                 (not (harmony)))
  )

  ;; Succumb: an object with pain can succumb.
  ;; Effects: the object regains province and planet status and restores harmony; pain is removed.
  (:action succumber_succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and (province ?x)
                 (planet ?x)
                 (harmony)
                 (not (pain ?x)))
  )

  ;; Overcome: an object that is in pain can overcome another object that is currently a province.
  ;; Parameters: ?x (the overcoming object), ?y (the other/province object).
  ;; Preconditions: ?y is a province, ?x is in pain.
  ;; Effects: harmony is established, ?x becomes a province, ?x craves ?y; ?y ceases to be a province; pain on ?x is removed.
  (:action overcomer_overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (harmony)
                 (province ?x)
                 (craves ?x ?y)
                 (not (province ?y))
                 (not (pain ?x)))
  )

  ;; Feast: an object that craves another, and is a province while harmony holds, can feast on that other.
  ;; Parameters: ?x (feaster), ?y (feasted-upon).
  ;; Preconditions: craves ?x ?y, province ?x, harmony
  ;; Effects: ?x goes into pain, ?y becomes a province; the craving is removed; ?x ceases to be a province; harmony is removed.
  (:action feaster_feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x)
                 (province ?y)
                 (not (craves ?x ?y))
                 (not (province ?x))
                 (not (harmony)))
  )
)