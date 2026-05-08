(define (domain mystery_blocksworld27)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates (canonical names from the specification)
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