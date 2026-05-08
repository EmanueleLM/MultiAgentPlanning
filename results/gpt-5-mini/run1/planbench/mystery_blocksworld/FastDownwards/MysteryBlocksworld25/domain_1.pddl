(define (domain mystery_blocksworld25)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (pain ?o - object)
    (craves ?o - object ?p - object)
    (harmony)
  )

  ;; Attack: requires province(object), planet(object), harmony.
  ;; Adds: pain(object). Deletes: province(object), planet(object), harmony.
  (:action Attack
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: requires pain(object).
  ;; Adds: province(object), planet(object), harmony. Deletes: pain(object).
  (:action Succumb
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome: requires province(other_object), pain(object).
  ;; Adds: harmony, province(object), craves(object, other_object).
  ;; Deletes: province(other_object), pain(object).
  (:action Overcome
    :parameters (?o - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: requires craves(object, other_object), province(object), harmony.
  ;; Adds: pain(object), province(other_object).
  ;; Deletes: craves(object, other_object), province(object), harmony.
  (:action Feast
    :parameters (?o - object ?other - object)
    :precondition (and
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)