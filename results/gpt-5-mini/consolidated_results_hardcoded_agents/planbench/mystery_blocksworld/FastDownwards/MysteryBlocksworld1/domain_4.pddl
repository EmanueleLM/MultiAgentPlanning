(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Attacker action: requires a province (some object), a planet (some object), and harmony.
  ;; Progresses the global stage from ?from to its successor ?to (enforces contiguous occupancy).
  (:action attacker_attack
    :parameters (?p - obj ?pl - obj ?from - stage ?to - stage)
    :precondition (and
      (province ?p)
      (planet ?pl)
      (harmony)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (pain)
      (not (province ?p))
      (not (planet ?pl))
      (not (harmony))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  ;; Succumber action: requires pain; restores province and planet to the specified object and harmony.
  ;; Consumes the pain condition and advances stage.
  (:action succumber_succumb
    :parameters (?x - obj ?from - stage ?to - stage)
    :precondition (and
      (pain)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  ;; Overcomer action: requires that ?other is a province and global pain holds.
  ;; Creates harmony, gives province to ?x, and makes ?x crave ?other; removes the province from ?other and clears pain.
  ;; Advances stage.
  (:action overcomer_overcome
    :parameters (?x - obj ?other - obj ?from - stage ?to - stage)
    :precondition (and
      (province ?other)
      (pain)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  ;; Feaster action: requires that ?x craves ?other, that ?x is a province, and harmony.
  ;; Produces pain and gives province to ?other; removes the craving, removes province from ?x, removes harmony.
  ;; Advances stage.
  (:action feaster_feast
    :parameters (?x - obj ?other - obj ?from - stage ?to - stage)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )
)