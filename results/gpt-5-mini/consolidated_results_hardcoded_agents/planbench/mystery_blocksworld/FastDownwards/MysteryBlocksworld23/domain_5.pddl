(define (domain mysteryblocksworld23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (craves ?o - obj ?p - obj)        ; ?o craves ?p
    (planet ?o - obj)                 ; ?o is a planet
    (province ?o - obj)               ; ?o is a province (territorial control)
    (attacked ?o - obj)               ; marker set by attack to link Succumb to the attacked object
    (harmony)                         ; global harmony phase fluent
    (pain)                            ; global pain phase fluent

    (stage ?s - stage)                ; stage objects for discrete progression
    (succ ?s - stage ?t - stage)      ; successor relation between stages (ordered)
    (current ?s - stage)              ; which stage is currently active
    (phase_harmony ?s - stage)        ; stage ?s corresponds to harmony phase
    (phase_pain ?s - stage)           ; stage ?s corresponds to pain phase
  )

  ; Attack: requires an object that is both province and planet, and global harmony,
  ; and the current stage must be a harmony stage. Advances the current stage to its successor,
  ; sets pain, clears harmony, removes the object's province and planet, and records it as attacked.
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
  ; Restores that object's province and planet, sets harmony, clears pain and the attacked marker,
  ; and advances the current stage to its successor.
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

  ; Overcome: in a pain stage, given some other object ?y that currently holds a province,
  ; create a craves relation from ?x to ?y, transfer the province to ?x (remove from ?y, add to ?x),
  ; restore harmony, clear pain, and advance the current stage.
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
  ; and advances the current stage.
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