(define (domain mystery_blocksworld17)
  (:requirements :strips)
  (:predicates
    (province ?o)
    (planet ?o)
    (harmony)
    (pain)
    (object_craves ?o ?other)
  )

  ;; ATTACK:
  ;; Pre: province ?obj, planet ?pl, harmony
  ;; Effects: pain, and remove province ?obj, planet ?pl, harmony
  (:action attack
    :parameters (?obj ?pl)
    :precondition (and (province ?obj) (planet ?pl) (harmony))
    :effect (and (pain)
                 (not (province ?obj))
                 (not (planet ?pl))
                 (not (harmony)))
  )

  ;; SUCCUMB:
  ;; Pre: pain
  ;; Effects: restore province ?obj, planet ?obj and harmony; remove pain
  (:action succumb
    :parameters (?obj)
    :precondition (and (pain))
    :effect (and (province ?obj)
                 (planet ?obj)
                 (harmony)
                 (not (pain)))
  )

  ;; OVERCOME:
  ;; Pre: province ?other, pain
  ;; Effects: set harmony, give province to ?obj, make ?obj crave ?other;
  ;;          remove province ?other and remove pain
  (:action overcome
    :parameters (?obj ?other)
    :precondition (and (province ?other) (pain))
    :effect (and (harmony)
                 (province ?obj)
                 (object_craves ?obj ?other)
                 (not (province ?other))
                 (not (pain)))
  )

  ;; FEAST:
  ;; Pre: object_craves ?obj ?other, province ?obj, harmony
  ;; Effects: produce pain, give province to ?other;
  ;;          remove the craving, remove province ?obj and harmony
  (:action feast
    :parameters (?obj ?other)
    :precondition (and (object_craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (pain)
                 (province ?other)
                 (not (object_craves ?obj ?other))
                 (not (province ?obj))
                 (not (harmony)))
  )
)