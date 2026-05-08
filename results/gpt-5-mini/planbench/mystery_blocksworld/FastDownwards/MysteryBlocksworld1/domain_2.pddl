(define (domain mystery_blocksworld1)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain)
  )

  ;; attacker: Attack action
  ;; pre: object has province and planet and global harmony
  ;; effect: global pain; remove province and planet from that object and remove harmony
  (:action attacker_attack
    :parameters (?o - object)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                  )
    :effect (and
              (pain)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
            )
  )

  ;; succumber: Succumb action
  ;; pre: global pain
  ;; effect: restore province and planet to the chosen object and restore harmony; clear pain
  (:action succumber_succumb
    :parameters (?o - object)
    :precondition (and
                    (pain)
                  )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain))
            )
  )

  ;; overcomer: Overcome action
  ;; pre: the 'other' object must have province, and global pain must be present
  ;; effect: create harmony, give province to the first object, make it crave the other,
  ;;         remove province from the other, and clear pain
  (:action overcomer_overcome
    :parameters (?o - object ?other - object)
    :precondition (and
                    (province ?other)
                    (pain)
                  )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain))
            )
  )

  ;; feaster: Feast action
  ;; pre: first object craves the other, first object has province, and harmony holds
  ;; effect: set global pain, transfer province to the other, remove the craves relation,
  ;;         remove province from the first, and remove harmony
  (:action feaster_feast
    :parameters (?o - object ?other - object)
    :precondition (and
                    (craves ?o ?other)
                    (province ?o)
                    (harmony)
                  )
    :effect (and
              (pain)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
            )
  )
)