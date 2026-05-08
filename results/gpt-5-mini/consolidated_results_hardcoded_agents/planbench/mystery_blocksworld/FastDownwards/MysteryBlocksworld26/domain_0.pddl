(define (domain provinces)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?x ?y - obj)
    (removedpair ?p ?pl - obj)  ; identity token created by Attack, consumed by Succumb
    (different ?x ?y - obj)     ; explicit distinctness relation used instead of built-in equality
    (harmony)
    (pain)
  )

  ;; Feast: consumes a craving and harmony, moves Province from ?x to ?y and produces Pain.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (different ?x ?y)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )

  ;; Overcome: uses Pain and Province(?y) to restore Harmony, re-create Craves(?x,?y) and move Province to ?x.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?y)
      (pain)
      (different ?x ?y)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ;; Attack: removes Province(?prov), Planet(?pl), and Harmony, produces Pain and records the removed pair.
  (:action attack
    :parameters (?prov - obj ?pl - obj)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (different ?prov ?pl)
    )
    :effect (and
      (pain)
      (removedpair ?prov ?pl)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb: can only restore the exact pair removed by an Attack (bound via removedpair token).
  (:action succumb
    :parameters (?prov - obj ?pl - obj)
    :precondition (and
      (pain)
      (removedpair ?prov ?pl)
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (removedpair ?prov ?pl))
    )
  )
)