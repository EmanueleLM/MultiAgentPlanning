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

  ; Attack: requires the same entity to have province and planet, and global harmony.
  ; Consumes those facts and produces pain on the same entity.
  ; Enforces forward progression by requiring (current ?p) and (next ?p ?q) and moving current to ?q.
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

  ; Feast: requires a craves relation from feeder to other, feeder has province and harmony.
  ; Produces pain on feeder and transfers province to the other entity; removes craving and harmony.
  ; Enforces forward progression via phases.
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

  ; Succumb: any object in pain restores province, planet and harmony on itself, and removes pain.
  ; Enforces forward progression via phases.
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

  ; Overcome: requires province on the 'other' entity and pain on object.
  ; Produces harmony, gives province to object, and creates craving from object to other.
  ; Removes province from other and pain on object.
  ; Enforces forward progression via phases.
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