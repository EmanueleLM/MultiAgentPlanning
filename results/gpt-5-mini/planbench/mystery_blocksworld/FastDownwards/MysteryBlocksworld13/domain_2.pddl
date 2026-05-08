(define (domain craving-economy)
  ;; Repaired, instance-specific domain for MysteryBlocksworld13.
  ;; Notes / assumptions (documented for the user):
  ;; - Actions and predicates follow the human specification exactly.
  ;; - province and planet are tokens that objects may hold.
  ;; - harmony is a single global token (zero-ary predicate).
  ;; - craves is a binary relation between objects.
  ;; - Attack and Succumb change the total number of province tokens;
  ;;   Overcome and Feast transfer province tokens between objects (total unchanged).
  ;; - The provided instance is likely unsolvable given the initial resource allocation
  ;;   (see audit reasoning): both required Overcome operations need the same province
  ;;   token at different times and the only way to produce b in pain requires consuming
  ;;   that same province, creating a cyclic dependency. This domain preserves the
  ;;   original semantics so the solver can detect infeasibility.
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)          ; object holds a Province token
    (planet ?o - object)            ; object holds a Planet token
    (pain ?o - object)              ; object is in pain
    (craves ?x - object ?y - object); object x craves object y
    (harmony)                       ; global harmony token
  )

  ;; Attack: actor consumes its province, planet and the global harmony and becomes in pain.
  (:action model_attacker-attack
    :parameters (?actor - object)
    :precondition (and
      (province ?actor)
      (planet ?actor)
      (harmony)
    )
    :effect (and
      (not (province ?actor))
      (not (planet ?actor))
      (not (harmony))
      (pain ?actor)
    )
  )

  ;; Succumb: a pained object succumbs, restoring province, planet and harmony, removing pain.
  (:action model_succumb-succumb
    :parameters (?obj - object)
    :precondition (and
      (pain ?obj)
    )
    :effect (and
      (not (pain ?obj))
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
  )

  ;; Overcome: actor (in pain) overcomes another object that currently has a province.
  ;; Effects: actor gains the other's province, the other loses its province; pain on actor removed;
  ;; a craves relation from actor to other is created; harmony is set.
  (:action model_overcomer-overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (pain ?actor)
      (province ?other)
    )
    :effect (and
      (not (pain ?actor))
      (not (province ?other))
      (province ?actor)
      (craves ?actor ?other)
      (harmony)
    )
  )

  ;; Feast: actor that craves other and holds a province and while harmony exists
  ;; feasts on other: this removes the craving and the actor's province and harmony,
  ;; and makes the 'other' be in pain and receive a province.
  (:action model_feaster-feast
    :parameters (?actor - object ?other - object)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
    )
    :effect (and
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (pain ?other)
      (province ?other)
    )
  )
)