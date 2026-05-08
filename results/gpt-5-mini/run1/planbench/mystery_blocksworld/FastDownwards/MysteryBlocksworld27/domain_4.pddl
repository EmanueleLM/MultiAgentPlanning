(define (domain mystery_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (craves ?o1 - obj ?o2 - obj)
    (next ?s - stage ?s2 - stage)
    (now-stage ?s - stage)
  )

  ;; Attack: consumes province of ?x, planet of ?y, and global harmony; produces pain on ?x.
  ;; Advances the global stage by one (requires an explicit successor stage).
  (:action attack
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?x)
      (planet ?y)
      (harmony)
      (now-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?y))
      (not (harmony))
      (not (now-stage ?s))
      (now-stage ?s2)
    )
  )

  ;; Succumb: consumes pain on ?x and restores province, planet and harmony.
  ;; Advances the global stage by one.
  (:action succumb
    :parameters (?x - obj ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?x)
      (now-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
      (not (now-stage ?s))
      (now-stage ?s2)
    )
  )

  ;; Overcome: requires a province on the "other" object ?y and pain on ?x.
  ;; It transfers province from ?y to ?x (deletes province ?y, adds province ?x), creates a craves link craves(?x,?y)
  ;; and restores harmony; consumes pain on ?x.
  ;; Advances the global stage by one.
  (:action overcome
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?y)
      (pain ?x)
      (now-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
      (not (now-stage ?s))
      (now-stage ?s2)
    )
  )

  ;; Feast: requires a craves relation from ?x to ?y, province on ?x, and harmony.
  ;; It produces pain on ?x and grants province to ?y; it consumes the craves link, province on ?x and harmony.
  ;; Advances the global stage by one.
  (:action feast
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (now-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (now-stage ?s))
      (now-stage ?s2)
    )
  )
)