(define (domain cravings-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (craves ?from - obj ?to - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (harmony)
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
    (different ?x - obj ?y - obj)
  )

  ;; Attack requires province and planet on the same object and global harmony.
  ;; It produces pain on that object, and removes its province and planet status and harmony.
  ;; Advances the current stage to enforce discrete, contiguous time progression.
  (:action attacker_attack
    :parameters (?x - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (province ?x)
      (planet ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Succumb requires pain on an object. It restores province and planet for that object and global harmony.
  ;; Advances the current stage.
  (:action succumb_succumb
    :parameters (?x - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (pain ?x)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Overcome requires that some other object Y currently has province and that X is in pain.
  ;; It gives harmony, makes X a province, makes X crave Y, and removes Y's province and X's pain.
  ;; Enforce that the 'other' object is distinct from the subject via the different predicate.
  ;; Advances the current stage.
  (:action overcomer_overcome
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (province ?y)
      (pain ?x)
      (different ?x ?y)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Feast requires that X craves Y, X is a province, and harmony holds.
  ;; It produces pain on X and makes Y a province; it removes the craving, X's province and harmony.
  ;; Enforce that the 'other' object is distinct from the subject via the different predicate.
  ;; Advances the current stage.
  (:action feaster_feast
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (different ?x ?y)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)