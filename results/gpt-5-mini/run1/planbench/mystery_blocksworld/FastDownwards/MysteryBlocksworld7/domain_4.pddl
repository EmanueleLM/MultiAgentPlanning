(define (domain mystery_craving)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Modeling choices (instance-specific):
  ;; - harmony is a single global fluent (0-arity predicate).
  ;; - province, planet, and pain are per-object unary predicates.
  ;; - craves is a binary directed relation (craves <from> <to>).
  ;; These choices follow the human specification where actions refer to "object" qualifiers.
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?from - obj ?to - obj)
  )

  ;; Attack: subject must have a province and a planet while global harmony holds.
  ;; Effects: subject gains pain; subject's province and planet are removed; global harmony is removed.
  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; Succumb: an object in pain restores its province and planet and the global harmony,
  ;; and ceases to be in pain.
  (:action succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome: subject ?x overcomes with respect to other ?y.
  ;; Requires: other ?y has a province and subject ?x is in pain.
  ;; Effects: set harmony, give province to subject ?x, create craves (?x -> ?y);
  ;;          remove province from other ?y and remove pain from subject ?x.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast: subject ?x consumes its craving for other ?y when subject has a province and harmony.
  ;; Effects: subject becomes in pain, other ?y gains a province, the craves relation (x->y) is removed,
  ;;          subject loses its province, and harmony is removed.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)