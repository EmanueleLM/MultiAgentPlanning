(define (domain mysteryblocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity phase)

  (:predicates
    (craves ?x - entity ?y - entity)
    (province ?x - entity)
    (planet ?x - entity)
    (harmony)
    (pain ?x - entity)
    (current ?p - phase)
    (next ?p - phase ?q - phase)
  )

  ;; Attack: requires province, planet, harmony on the same object.
  ;; Consumes those and produces pain. Advances the global phase from ?p to ?q.
  (:action attacker-attack
    :parameters (?o - entity ?p - phase ?q - phase)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
              (not (current ?p))
              (current ?q)
            )
  )

  ;; Feast: feeder ?o craves ?other, has province, and harmony.
  ;; Feast produces pain on feeder and transfers province to other; removes craving and harmony.
  ;; Advances the global phase from ?p to ?q.
  (:action feaster-feast
    :parameters (?o - entity ?other - entity ?p - phase ?q - phase)
    :precondition (and
                    (craves ?o ?other)
                    (province ?o)
                    (harmony)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (pain ?o)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
              (not (current ?p))
              (current ?q)
            )
  )

  ;; Succumb: object in pain restores province, planet and harmony.
  ;; Removes pain. Advances the global phase from ?p to ?q.
  (:action succumber-succumb
    :parameters (?o - entity ?p - phase ?q - phase)
    :precondition (and
                    (pain ?o)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
              (not (current ?p))
              (current ?q)
            )
  )

  ;; Overcome: requires province on other and pain on object.
  ;; Produces harmony, gives province to object, creates craving from object to other.
  ;; Removes province from other and removes pain on object.
  ;; Advances the global phase from ?p to ?q.
  (:action overcomer-overcome
    :parameters (?o - entity ?other - entity ?p - phase ?q - phase)
    :precondition (and
                    (province ?other)
                    (pain ?o)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain ?o))
              (not (current ?p))
              (current ?q)
            )
  )
)