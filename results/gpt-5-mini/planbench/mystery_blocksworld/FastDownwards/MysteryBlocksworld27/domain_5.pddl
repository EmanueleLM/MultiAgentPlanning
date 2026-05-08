(define (domain mystery_blocksworld27)
  (:requirements :strips :typing)
  (:types obj)

  ;; Predicates correspond exactly to the fluents described in the specification.
  (:predicates
    (craves ?x - obj ?y - obj)   ; ?x craves ?y
    (province ?x - obj)          ; province holds at ?x
    (planet ?x - obj)            ; planet holds at ?x
    (harmony)                    ; global harmony flag
    (pain ?x - obj)              ; ?x is in pain
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
    :precondition (and (pain ?x))
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