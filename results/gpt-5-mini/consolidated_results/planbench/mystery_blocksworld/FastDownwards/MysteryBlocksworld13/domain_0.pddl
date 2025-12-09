(define (domain crave_domain)
  ;; Domain constructed from agent models and auditor clarifications.
  ;; Conventions/assumptions encoded:
  ;; - Objects: explicit universe of objects (declared in problem).
  ;; - Province(X), Planet(X), Pain(X) are boolean per-object tokens.
  ;; - Harmony is a single global boolean token.
  ;; - Craves(X,Y) is a directed relation (X craves Y).
  ;; - Self-targeting is forbidden by requiring (different ?x ?y) for two-arg transfer actions.
  ;; - Duplicate Province tokens prevented by preconditions that require absence before creation.
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
    ;; explicit distinctness predicate to enforce X != Y without using equality requirements
    (different ?x - obj ?y - obj)
  )

  ;; Attacker agent: Attack consumes Province, Planet and Harmony on the same object,
  ;; producing Pain tied to that object and removing Harmony.
  (:action attacker-attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (pain ?x)
    )
  )

  ;; Succumb agent: resolves Pain for an object and restores its Province and Planet and Harmony.
  ;; To avoid creating duplicate Province/Planet tokens, require Province and Planet to be absent.
  (:action model_succumb-succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x) (not (province ?x)) (not (planet ?x)))
    :effect (and
      (not (pain ?x))
      (province ?x)
      (planet ?x)
      (harmony)
    )
  )

  ;; Overcomer agent: uses Pain of X and Province of Y (Y != X) to transfer Province to X,
  ;; create a craving of X for Y, restore Harmony, and consume Pain(X) and Province(Y).
  ;; To avoid duplicate Province tokens, require X not already have Province.
  (:action model_overcomer-overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y) (not (province ?x)) (different ?x ?y))
    :effect (and
      (not (pain ?x))
      (not (province ?y))
      (province ?x)
      (craves ?x ?y)
      (harmony)
    )
  )

  ;; Feaster agent: X feasts on Y when X craves Y, X has Province, and Harmony is available.
  ;; Consumes X's Province and Harmony, removes the craving, produces Pain(X) and transfers Province to Y.
  (:action model_feaster-feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony) (different ?x ?y))
    :effect (and
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (pain ?x)
      (province ?y)
    )
  )
)