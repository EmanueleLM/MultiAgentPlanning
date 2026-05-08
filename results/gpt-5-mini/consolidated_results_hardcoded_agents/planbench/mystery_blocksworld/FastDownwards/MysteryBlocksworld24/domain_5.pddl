(define (domain mysteryblocksworld24)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (planet ?x - object)
    (province ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?x - object ?y - object)
    (stage ?s - stage)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; attacker: Attack consumes the current stage and advances to the next stage
  ;; Preconditions: province(obj), planet(obj), harmony, current(stage) and a defined next(stage,next)
  ;; Effects: produces pain(obj), removes province(obj), planet(obj), harmony, and advances current stage
  (:action attacker-attack
    :parameters (?obj - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  ;; succumber: Succumb consumes current stage and advances to the next stage
  ;; Preconditions: pain(obj), current(stage) and next(stage,next)
  ;; Effects: restores province(obj), planet(obj), harmony; removes pain(obj); advances stage
  (:action succumber-succumb
    :parameters (?obj - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (pain ?obj)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  ;; overcomer: Overcome consumes current stage and advances
  ;; Preconditions: province(other), pain(obj), current(stage) and next(stage,next)
  ;; Effects: sets harmony, province(obj), creates craves(obj,other), removes province(other) and pain(obj), advances stage
  (:action overcomer-overcome
    :parameters (?obj - object ?other - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (province ?other)
      (pain ?obj)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
    )
  )

  ;; feaster: Feast consumes current stage and advances
  ;; Preconditions: craves(obj,other), province(obj), harmony, current(stage) and next(stage,next)
  ;; Effects: produces pain(obj), province(other); removes craves(obj,other), province(obj), harmony; advances stage
  (:action feaster-feast
    :parameters (?obj - object ?other - object ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (craves ?obj ?other)
      (province ?obj)
      (harmony)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (pain ?obj)
      (province ?other)
      (not (craves ?obj ?other))
      (not (province ?obj))
      (not (harmony))
    )
  )
)