(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing)

  (:predicates
    (province ?x - thing)
    (planet ?x - thing)
    (harmony)
    (pain ?x - thing)
    (craves ?x - thing ?y - thing)
  )

  ;; Attack: requires province, planet and global harmony on the same object;
  ;; produces pain on that object and removes province, planet and harmony.
  (:action attacker-attack
    :parameters (?obj - thing)
    :precondition (and
                    (province ?obj)
                    (planet ?obj)
                    (harmony)
                  )
    :effect (and
              (pain ?obj)
              (not (province ?obj))
              (not (planet ?obj))
              (not (harmony))
            )
  )

  ;; Succumb: reverses a pain state, restoring province, planet and harmony.
  (:action succumber-succumb
    :parameters (?obj - thing)
    :precondition (and
                    (pain ?obj)
                  )
    :effect (and
              (province ?obj)
              (planet ?obj)
              (harmony)
              (not (pain ?obj))
            )
  )

  ;; Overcome: requires that ?obj is in pain and ?other holds province;
  ;; after overcoming, harmony and province on ?obj are true and ?obj craves ?other;
  ;; province on ?other and pain on ?obj become false.
  (:action overcomer-overcome
    :parameters (?obj - thing ?other - thing)
    :precondition (and
                    (province ?other)
                    (pain ?obj)
                  )
    :effect (and
              (harmony)
              (province ?obj)
              (craves ?obj ?other)
              (not (province ?other))
              (not (pain ?obj))
            )
  )

  ;; Feast: consumes an existing craving along with province and harmony on the craver;
  ;; it produces pain on the craver and grants province to the craved entity,
  ;; and removes the original craving, the craver's province, and harmony.
  (:action feaster-feast
    :parameters (?craver - thing ?meal - thing)
    :precondition (and
                    (craves ?craver ?meal)
                    (province ?craver)
                    (harmony)
                  )
    :effect (and
              (pain ?craver)
              (province ?meal)
              (not (craves ?craver ?meal))
              (not (province ?craver))
              (not (harmony))
            )
  )
)