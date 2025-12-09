(define (domain craving-domain)
  :requirements :strips :typing :negative-preconditions
  :types obj
  :predicates
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x ?y - obj)
    (pain ?x - obj)
    (harmony)
    ;; explicit distinctness predicate to avoid using equality in preconditions
    (distinct ?x ?y - obj)
  ;; Actions correspond to the provided capabilities. Each action's signature
  ;; follows the canonical mapping: ?x = primary object, ?y = "other" object.
  (:action Attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action Succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action Overcome
    :parameters (?x - obj ?y - obj)
    ;; Overcome(?x ?y): requires province(y) and pain(x) and that x and y are distinct.
    ;; Effects: restore harmony, grant province(x), create craves(x,y),
    ;; delete province(y) and delete pain(x).
    :precondition (and (province ?y) (pain ?x) (distinct ?x ?y))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  (:action Feast
    :parameters (?x - obj ?y - obj)
    ;; Feast(?x ?y): requires craves(x,y), province(x), harmony, and distinctness.
    ;; Effects: produce pain(y), give province(y), remove the craves relation,
    ;; remove province(x) and remove harmony.
    :precondition (and (craves ?x ?y) (province ?x) (harmony) (distinct ?x ?y))
    :effect (and
      (pain ?y)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)