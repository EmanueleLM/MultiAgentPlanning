(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    ;; canonicalized predicates (lower-case, explicit arities)
    (province ?o - object)        ; unary: object currently holds province
    (planet ?o - object)          ; unary: planet marker (kept to match input facts/actions)
    (pain ?o - object)            ; unary: object is in pain (transitional token)
    (craves ?s - object ?t - object) ; binary: subject craves target
    (harmony)                     ; 0-ary: global harmony flag
    ;; irrevocable markers used to prevent infinite toggles/cycles
    (attacked ?o - object)        ; set when an Attack by its agent has been applied to ?o
    (succumbed ?o - object)       ; set when Succumb applied to ?o
    (overcome_done ?s - object ?o - object) ; set when Overcome(s,o) has been applied
    (feasted ?s - object ?o - object)       ; set when Feast(s,o) has been applied
  )

  ;; Action provided by the Attack agent (prefixed to preserve agent identity)
  (:action attack_attack
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (attacked ?o))
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (attacked ?o)
    )
  )

  ;; Succumb action provided by agent 'relish' (prefixed)
  ;; Succumb consumes pain and (re)establishes province, planet, and global harmony.
  (:action relish_succumb
    :parameters (?x - object)
    :precondition (and
      (pain ?x)
      (not (succumbed ?x))
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
      (succumbed ?x)
    )
  )

  ;; Overcome action provided by agent 'OvercomeFeast' (prefixed)
  ;; Overcome reverses a province relation between two objects, clears pain on subject,
  ;; establishes a craving, sets harmony, and is one-shot per pair (overcome_done).
  (:action overcome_overcome
    :parameters (?subject - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?subject)
      (not (overcome_done ?subject ?other))
    )
    :effect (and
      (harmony)
      (province ?subject)
      (craves ?subject ?other)
      (not (province ?other))
      (not (pain ?subject))
      (overcome_done ?subject ?other)
    )
  )

  ;; Feast action (version from OvercomeFeast agent). Prefixed to preserve agent identity.
  ;; Feast consumes Craves(subject,other), requires subject have province and global harmony;
  ;; it produces pain(subject), flips province back to other, clears harmony, and is one-shot per pair.
  (:action overcome_feast
    :parameters (?subject - object ?other - object)
    :precondition (and
      (craves ?subject ?other)
      (province ?subject)
      (harmony)
      (not (feasted ?subject ?other))
    )
    :effect (and
      (pain ?subject)
      (province ?other)
      (not (craves ?subject ?other))
      (not (province ?subject))
      (not (harmony))
      (feasted ?subject ?other)
    )
  )

  ;; Feast action (version from 'relish' agent). Semantically equivalent to overcome_feast
  ;; but separate name preserves agent distinction in plans.
  (:action relish_feast
    :parameters (?subject - object ?other - object)
    :precondition (and
      (craves ?subject ?other)
      (province ?subject)
      (harmony)
      (not (feasted ?subject ?other))
    )
    :effect (and
      (pain ?subject)
      (province ?other)
      (not (craves ?subject ?other))
      (not (province ?subject))
      (not (harmony))
      (feasted ?subject ?other)
    )
  )
)