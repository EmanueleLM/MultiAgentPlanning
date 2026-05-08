(define (domain harmony-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x - obj ?y - obj)
    (attacked ?x - obj)
    (harmony)
    (pain)
  )

  ;; Attack: consumes province and planet of ?o and global harmony, produces global pain and marks ?o as attacked.
  (:action Attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain)
      (attacked ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: can only restore the specific attacked object while pain holds.
  (:action Succumb
    :parameters (?o - obj)
    :precondition (and (pain) (attacked ?o))
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
      (not (attacked ?o))
    )
  )

  ;; Overcome: transfers province from ?other to ?o while pain holds; restores harmony and creates craving.
  ;; Maintains province=>planet invariant by also adding planet for ?o. Removes attacked mark for ?o to avoid staleness.
  (:action Overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain))
    :effect (and
      (harmony)
      (province ?o)
      (planet ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain))
      (not (attacked ?o))
    )
  )

  ;; Feast: consumes a craving, the object's province and harmony, produces pain and transfers province to ?other.
  ;; When adding province(?other) we also add planet(?other) to preserve the invariant.
  (:action Feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
      (pain)
      (province ?other)
      (planet ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
      (not (attacked ?o))
    )
  )
)