(define (domain feast-domain)
  ; Domain created to integrate annotated schemata and auditor corrections.
  ; Conservative assumptions were made where the original inputs were ambiguous:
  ; - All objects a,b,c,d are creatures and start alive.
  ; - An explicit three-step sequence is required for one creature to "crave" another:
  ;   attack -> (succumb OR overcome) -> feast. This ordering is enforced by predicates.
  ; - The agent that defeats a target (via succumb or overcome) must be the same agent that may feast on that target.
  ; - No penalty or bookkeeping shortcuts are used; violation of these constraints is impossible.
  :requirements :strips :typing :negative-preconditions
  :types creature

  :predicates
    ; creature state predicates
    (alive ?x - creature)
    (defeated ?x - creature)
    (defeated-by ?victim - creature ?winner - creature)

    ; action sequencing bookkeeping
    (attacked ?attacker - creature ?target - creature)
    (overcame ?attacker - creature ?target - creature)

    ; actor state
    (hungry ?x - creature)
    (fed ?x - creature)

    ; final relation required by the problem
    (craves ?x - creature ?y - creature)
  )

  ; Attack: attacker initiates combat with target. Must be alive and target not already defeated.
  (:action attack
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (not (defeated ?target))
      ; prevent redundant attacks on same target by same attacker if already recorded
      (not (attacked ?attacker ?target))
    )
    :effect (and
      (attacked ?attacker ?target)
    )
  )

  ; Succumb: target yields to the attacker. Requires prior attack. Records defeat-by relation,
  ; makes the attacker hungry, and prevents other defeat events for the same pair.
  (:action succumb
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (attacked ?attacker ?target)
      (alive ?target)
      (not (defeated ?target))
      (not (defeated-by ?target ?attacker))
      (not (overcame ?attacker ?target))
    )
    :effect (and
      (defeated ?target)
      (defeated-by ?target ?attacker)
      (hungry ?attacker)
      (not (attacked ?attacker ?target))
    )
  )

  ; Overcome: attacker actively overcomes the target. Symmetric to succumb but recorded as overcome.
  (:action overcome
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (attacked ?attacker ?target)
      (alive ?target)
      (not (defeated ?target))
      (not (defeated-by ?target ?attacker))
      (not (overcame ?attacker ?target))
    )
    :effect (and
      (defeated ?target)
      (defeated-by ?target ?attacker)
      (overcame ?attacker ?target)
      (hungry ?attacker)
      (not (attacked ?attacker ?target))
    )
  )

  ; Feast: attacker feasts on a target that it defeated. This consumes the target (target no longer alive),
  ; marks the attacker as fed, and establishes a craving relation (craves attacker target) required by the problem.
  (:action feast
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (alive ?attacker)
      (defeated ?target)
      (defeated-by ?target ?attacker)
      (hungry ?attacker)
      (not (fed ?attacker))
    )
    :effect (and
      (fed ?attacker)
      (craves ?attacker ?target)
      (not (alive ?target))
      ; keep defeated and defeated-by facts for auditing but target is no longer alive
    )
  )