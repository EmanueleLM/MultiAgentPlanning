(define (domain mystery_blocksworld27)
  (:requirements :strips :typing)
  (:types obj)

  ;; Domain modeling notes:
  ;; - 'harmony' is modeled as a global 0-ary fluent.
  ;; - 'pain' is modeled per-object (pain ?x) to allow actions to target
  ;;   which object is in pain. This preserves the causal footprints in
  ;;   the original specification (attack/feast produce pain for a subject,
  ;;   succumb/overcome consume that object's pain).
  ;; - The word "other" in action descriptions is represented by a separate
  ;;   parameter (?other). We do not enforce inequality (?x != ?other) with
  ;;   an explicit PDDL inequality to remain within simple STRIPS-style
  ;;   constructs; planners can still bind different objects as needed.

  (:predicates
    (craves ?x - obj ?y - obj)   ; object ?x craves object ?y
    (province ?x - obj)         ; province holds at object ?x
    (planet ?x - obj)           ; planet holds at object ?x
    (harmony)                   ; global harmony flag
    (pain ?x - obj)             ; object ?x is in pain
  )

  ;; Attack action:
  ;; Preconditions: province ?x, planet ?x, harmony
  ;; Adds: pain ?x
  ;; Deletes: province ?x, planet ?x, harmony
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

  ;; Succumb action:
  ;; Preconditions: pain ?x
  ;; Adds: province ?x, planet ?x, harmony
  ;; Deletes: pain ?x
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

  ;; Overcome action:
  ;; Preconditions: province ?other, pain ?x
  ;; Adds: harmony, province ?x, craves ?x ?other
  ;; Deletes: province ?other, pain ?x
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

  ;; Feast action:
  ;; Preconditions: craves ?x ?other, province ?x, harmony
  ;; Adds: pain ?x, province ?other
  ;; Deletes: craves ?x ?other, province ?x, harmony
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