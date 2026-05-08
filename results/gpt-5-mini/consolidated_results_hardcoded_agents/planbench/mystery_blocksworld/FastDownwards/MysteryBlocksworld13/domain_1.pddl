(define (domain crave_domain)
  ;; Domain reconstructed to enforce explicit discrete-stage progression and
  ;; hard causal constraints. Assumptions and modeling choices are recorded
  ;; as comments here.
  ;; Assumptions:
  ;;  - Time is modeled as a discrete sequence of stages; each action must be
  ;;    executed at the current stage and advances the current stage to its successor.
  ;;  - A global singleton 'harmony' predicate models the single Harmony token.
  ;;  - The predicate 'different' is supplied in the problem file for all ordered
  ;;    unequal pairs; actions requiring different objects rely on those facts.
  ;;  - No additional bookkeeping tokens or post-hoc penalty actions are used.
  ;;    All ordering and resource constraints are enforced via preconditions/effects.
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; object-level state
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
    (different ?x - obj ?y - obj)

    ;; explicit discrete-time/stage modeling
    (stage ?s - stage)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Attacker agent: Attack consumes Province(?x), Planet(?x) and Harmony,
  ;; produces Pain(?x), removes Province(?x), Planet(?x) and Harmony,
  ;; and advances the current stage to its successor.
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

  ;; Succumb agent: requires Pain(?x). Restores Province(?x), Planet(?x), and Harmony,
  ;; clears Pain(?x), and advances the stage.
  ;; This matches the specification: no extra preconditions beyond Pain.
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

  ;; Overcomer agent: requires Province(?y) and Pain(?x) (y may differ from x).
  ;; Effects: creates Harmony, gives Province to x, creates Craves(x,y), removes Province(y) and Pain(x),
  ;; and advances stage.
  (:action overcomer-overcome
    :parameters (?x - obj ?y - obj ?t1 - stage ?t2 - stage)
    :precondition (and (pain ?x) (province ?y) (different ?x ?y) (current ?t1) (succ ?t1 ?t2))
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

  ;; Feaster agent: requires Craves(?x,?y), Province(?x), and Harmony.
  ;; Effects: produces Pain(?x), gives Province to ?y, removes the craving, removes Province(?x) and Harmony,
  ;; and advances the stage.
  (:action feaster-feast
    :parameters (?x - obj ?y - obj ?t1 - stage ?t2 - stage)
    :precondition (and (craves ?x ?y) (province ?x) (harmony) (different ?x ?y) (current ?t1) (succ ?t1 ?t2))
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