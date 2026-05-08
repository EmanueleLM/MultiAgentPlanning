(define (domain OvercomeFeastDomain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    ;; per-object status predicates
    (province ?o - object)
    (planet ?o - object)
    (pain ?o - object)

    ;; global flag (zero-arity)
    (harmony)

    ;; binary relations
    (craves ?s - object ?t - object)

    ;; locks / refractory tokens to enforce non-instant reversibility
    (needs_recovery ?o - object)        ; set by Attack on the target object, cleared by wait-recovery
    (craves_locked ?s - object ?t - object) ; set by Overcome, cleared by wait-crave

    ;; explicit distinctness relation to enforce attacker != target etc.
    (different ?x - object ?y - object)
  )

  ;; ATTACK (agent label preserved in name)
  (:action attack-action
    :parameters (?attacker - object ?target - object)
    :precondition (and
      (province ?attacker)
      (planet ?target)
      (harmony)
      (different ?attacker ?target)
    )
    :effect (and
      (pain ?target)
      (needs_recovery ?target)
      (not (province ?attacker))
      (not (planet ?target))
      (not (harmony))
    )
  )

  ;; SUCCUMB (agent label preserved)
  ;; Requires Pain and a cleared recovery lock (no immediate succumbing).
  (:action succumb-action
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
      (not (needs_recovery ?o))
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; OVERCOME (agent label preserved)
  ;; Transfers province from OTHER to SUBJECT, creates a craving and locks it to require a wait
  (:action overcome-action
    :parameters (?subject - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?subject)
      (different ?subject ?other)
    )
    :effect (and
      (harmony)
      (province ?subject)
      (craves ?subject ?other)
      (craves_locked ?subject ?other)
      (not (province ?other))
      (not (pain ?subject))
    )
  )

  ;; FEAST (agent label preserved)
  ;; Consumes a craving (if unlocked), requires Harmony and province(subject)
  (:action feast-action
    :parameters (?subject - object ?other - object)
    :precondition (and
      (craves ?subject ?other)
      (province ?subject)
      (harmony)
      (different ?subject ?other)
      (not (craves_locked ?subject ?other))
    )
    :effect (and
      (pain ?subject)
      (province ?other)
      (not (craves ?subject ?other))
      (not (province ?subject))
      (not (harmony))
    )
  )

  ;; WAIT / clear the needs_recovery lock for a specific object
  (:action wait-recovery
    :parameters (?o - object)
    :precondition (and
      (needs_recovery ?o)
    )
    :effect (and
      (not (needs_recovery ?o))
    )
  )

  ;; WAIT / clear the craves lock for a specific (subject,other) pair
  (:action wait-crave
    :parameters (?s - object ?o - object)
    :precondition (and
      (craves_locked ?s ?o)
    )
    :effect (and
      (not (craves_locked ?s ?o))
    )
  )
)