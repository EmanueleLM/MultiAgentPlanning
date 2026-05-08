(define (domain mystery_blocksworld27)
  (:requirements :strips :typing)
  (:types obj)

  ;; Modeling notes:
  ;; - harmony is a 0-ary fluent (global flag).
  ;; - pain is modeled per-object (pain ?x) so actions can target which object is in pain.
  ;; - The parameter named ?other in two-argument actions represents the "other" object from the specification.
  ;;   We deliberately do not enforce an inequality constraint (?x != ?other) to keep the domain STRIPS-compatible
  ;;   and specific to this instance; planners will choose distinct or equal bindings as they find applicable.

  (:predicates
    (craves ?x - obj ?y - obj)   ; object ?x craves object ?y
    (province ?x - obj)         ; province holds at object ?x
    (planet ?x - obj)           ; planet holds at object ?x
    (harmony)                   ; global harmony flag
    (pain ?x - obj)             ; object ?x is in pain
  )

  ;; Attack:
  ;; Preconditions: province ?x, planet ?x, harmony
  ;; Effects: add pain ?x; delete province ?x, planet ?x, harmony
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

  ;; Succumb:
  ;; Preconditions: pain ?x
  ;; Effects: add province ?x, planet ?x, harmony; delete pain ?x
  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome:
  ;; Preconditions: province ?other, pain ?x
  ;; Effects: add harmony, province ?x, craves ?x ?other; delete province ?other, pain ?x
  (:action overcome
    :parameters (?x - obj ?other - obj)
    :precondition (and (province ?other) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain ?x))
    )
  )

  ;; Feast:
  ;; Preconditions: craves ?x ?other, province ?x, harmony
  ;; Effects: add pain ?x, province ?other; delete craves ?x ?other, province ?x, harmony
  (:action feast
    :parameters (?x - obj ?other - obj)
    :precondition (and (craves ?x ?other) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
    )
  )
)