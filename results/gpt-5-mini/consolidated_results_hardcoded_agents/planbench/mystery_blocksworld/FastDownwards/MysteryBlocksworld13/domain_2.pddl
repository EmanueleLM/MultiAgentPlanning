(define (domain crave_domain)
  ;; Compacted domain: replace explicit enumerated 'different' relation with a small
  ;; 'same' relation (only equal pairs listed in the problem init). Actions use
  ;; negative preconditions (not (same ...)) to require distinct objects without
  ;; enumerating all unequal pairs.
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; object-level state
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
    (same ?x - obj ?y - obj)

    ;; discrete-time/stage modeling
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Attack: consumes Province(?x), Planet(?x) and Harmony,
  ;; produces Pain(?x), removes Province(?x), Planet(?x) and Harmony,
  ;; and advances the current stage.
  (:action attacker-attack
    :parameters (?x - obj ?t1 - stage ?t2 - stage)
    :precondition (and (province ?x) (planet ?x) (harmony) (current ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (pain ?x)
      ;; advance stage
      (not (current ?t1))
      (current ?t2)
    )
  )

  ;; Succumb: requires Pain(?x). Restores Province(?x), Planet(?x), and Harmony,
  ;; clears Pain(?x), and advances the stage.
  (:action succumb-succumb
    :parameters (?x - obj ?t1 - stage ?t2 - stage)
    :precondition (and (pain ?x) (current ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (pain ?x))
      (province ?x)
      (planet ?x)
      (harmony)
      ;; advance stage
      (not (current ?t1))
      (current ?t2)
    )
  )

  ;; Overcome: requires Pain(?x) and Province(?y) for a distinct other object y.
  ;; Effects: creates Harmony, gives Province to x, creates Craves(x,y), removes Province(y) and Pain(x),
  ;; and advances stage.
  (:action overcomer-overcome
    :parameters (?x - obj ?y - obj ?t1 - stage ?t2 - stage)
    :precondition (and (pain ?x) (province ?y) (not (same ?x ?y)) (current ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (pain ?x))
      (not (province ?y))
      (province ?x)
      (craves ?x ?y)
      (harmony)
      ;; advance stage
      (not (current ?t1))
      (current ?t2)
    )
  )

  ;; Feast: requires Craves(?x,?y), Province(?x), and Harmony for distinct objects.
  ;; Effects: produces Pain(?x), gives Province to ?y, removes the craving, removes Province(?x) and Harmony,
  ;; and advances the stage.
  (:action feaster-feast
    :parameters (?x - obj ?y - obj ?t1 - stage ?t2 - stage)
    :precondition (and (craves ?x ?y) (province ?x) (harmony) (not (same ?x ?y)) (current ?t1) (succ ?t1 ?t2))
    :effect (and
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (pain ?x)
      (province ?y)
      ;; advance stage
      (not (current ?t1))
      (current ?t2)
    )
  )
)