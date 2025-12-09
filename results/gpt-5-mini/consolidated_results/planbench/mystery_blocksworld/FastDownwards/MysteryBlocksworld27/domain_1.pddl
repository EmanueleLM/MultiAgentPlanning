(define (domain mystery-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?o - obj ?t - obj)
    (harmony)
    (pain)
  )

  ;; Attack: consumes province, planet and harmony on the same object and produces global pain.
  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
             (pain)
             (not (province ?o))
             (not (planet ?o))
             (not (harmony))
            )
  )

  ;; Succumb: consumes global pain and restores province, planet and harmony for a chosen object.
  ;; Note: this action requires the global pain fluent and removes it as specified.
  (:action succumb
    :parameters (?o - obj)
    :precondition (and (pain))
    :effect (and
             (province ?o)
             (planet ?o)
             (harmony)
             (not (pain))
            )
  )

  ;; Overcome: requires province on the "other" object and global pain. Produces harmony,
  ;; grants province to the primary object and creates a craves relation from primary->other.
  ;; It removes the province on the "other" object and clears pain as specified.
  (:action overcome
    :parameters (?p - obj ?other - obj)
    :precondition (and (province ?other) (pain))
    :effect (and
             (harmony)
             (province ?p)
             (craves ?p ?other)
             (not (province ?other))
             (not (pain))
            )
  )

  ;; Feast: requires an existing craves relation (primary craves other), province on primary, and harmony.
  ;; It produces global pain and grants province to the other; it removes the craves relation,
  ;; the province on the primary, and harmony as specified.
  (:action feast
    :parameters (?p - obj ?other - obj)
    :precondition (and (craves ?p ?other) (province ?p) (harmony))
    :effect (and
             (pain)
             (province ?other)
             (not (craves ?p ?other))
             (not (province ?p))
             (not (harmony))
            )
  )
)