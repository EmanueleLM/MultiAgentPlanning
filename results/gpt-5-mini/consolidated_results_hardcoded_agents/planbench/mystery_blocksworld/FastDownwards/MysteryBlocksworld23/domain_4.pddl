(define (domain mysteryblocksworld23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (craves ?o - obj ?p - obj)        ; ?o craves ?p
    (planet ?o - obj)                 ; ?o is a planet
    (province ?o - obj)               ; ?o is a province (territorial control)
    (attacked ?o - obj)               ; marker: ?o was attacked (links Attack -> Succumb)
    (harmony)                         ; global harmony phase fluent
    (pain)                            ; global pain phase fluent

    (stage ?s - stage)                ; stage objects for discrete progression
    (succ ?s - stage ?t - stage)      ; successor relation between stages (ordered)
    (current ?s - stage)              ; which stage is currently active
    (phase_harmony ?s - stage)        ; stage ?s corresponds to harmony phase
    (phase_pain ?s - stage)           ; stage ?s corresponds to pain phase
  )

  ; Attack: requires a specific object that is both province and planet, and harmony in a harmony stage.
  ; Effects: set global pain, clear harmony, remove that object's province and planet, mark it attacked,
  ; and advance current stage from ?s to its successor ?t (enforces contiguous stage occupancy).
  (:action attack
    :parameters (?x - obj ?s - stage ?t - stage)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
      (current ?s)
      (succ ?s ?t)
      (phase_harmony ?s)
    )
    :effect (and
      (pain)
      (not (harmony))
      (not (province ?x))
      (not (planet ?x))
      (attacked ?x)
      (not (current ?s))
      (current ?t)
    )
  )

  ; Succumb: resolves a previously attacked object while in a pain stage.
  ; Requires the object to have been attacked and the system to be in the current pain stage.
  ; Effects: restore that object's province and planet, set harmony, clear pain and the attacked marker,
  ; and advance the current stage.
  (:action succumb
    :parameters (?x - obj ?s - stage ?t - stage)
    :precondition (and
      (pain)
      (attacked ?x)
      (current ?s)
      (succ ?s ?t)
      (phase_pain ?s)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
      (not (attacked ?x))
      (not (current ?s))
      (current ?t)
    )
  )

  ; Overcome: while in a pain stage and given some other object ?y that currently holds a province,
  ; create a craves relation from ?x to ?y, transfer a province to ?x (remove from ?y, add to ?x),
  ; restore harmony, clear pain, and advance the stage.
  (:action overcome
    :parameters (?x - obj ?y - obj ?s - stage ?t - stage)
    :precondition (and
      (province ?y)
      (pain)
      (current ?s)
      (succ ?s ?t)
      (phase_pain ?s)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
      (not (current ?s))
      (current ?t)
    )
  )

  ; Feast: while in a harmony stage, an object ?x that craves ?y and currently holds a province consumes that craving,
  ; transfers the province to the craved object ?y, enters pain, clears harmony, removes the craves relation,
  ; and advances the stage.
  (:action feast
    :parameters (?x - obj ?y - obj ?s - stage ?t - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?s)
      (succ ?s ?t)
      (phase_harmony ?s)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?s))
      (current ?t)
    )
  )
)