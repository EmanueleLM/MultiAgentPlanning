(define (domain predator-domain)
  ;; Domain for creatures a,b,c,d with actions: attack, succumb, overcome, feast.
  ;; Ambiguities in the original description were resolved conservatively:
  ;; - Only the minimal predicates needed to encode ordering and impossibility of violations are included.
  ;; - "craves" is established only by a successful feast and must hold at the goal.
  ;; - The sequence enforced for a predator-prey interaction is: attack -> succumb -> feast.
  ;; - No additional resources, tokens, or penalty actions are introduced.
  (:requirements :strips :typing :negative-preconditions)
  (:types creature)

  (:predicates
    (alive ?c - creature)                ; creature is alive
    (dominating ?x - creature ?y - creature) ; x has dominance over y (result of attack/overcome)
    (succumbed ?c - creature)            ; creature has succumbed (can be feasted upon)
    (overcame ?x - creature ?y - creature) ; x overcame y (record of overcome action)
    (craves ?x - creature ?y - creature) ; x craves y (goal is to have this true for certain pairs)
  )

  ;; attack: attacker establishes dominance over target.
  ;; Precondition: both alive, target not already succumbed, and no redundant dominance relation.
  (:action attack
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (not (succumbed ?target))
      (not (dominating ?attacker ?target))
    )
    :effect (and
      (dominating ?attacker ?target)
    )
  )

  ;; succumb: target yields to an existing dominator.
  ;; Precondition: dominator already established dominance over target; target must be alive and not already succumbed.
  ;; Effect: mark target as succumbed. This is required before feast.
  (:action succumb
    :parameters (?target - creature ?to - creature)
    :precondition (and
      (alive ?target)
      (alive ?to)
      (dominating ?to ?target)
      (not (succumbed ?target))
    )
    :effect (and
      (succumbed ?target)
    )
  )

  ;; overcome: challenger reverses an existing dominance relation.
  ;; Precondition: defender currently dominates challenger; neither is succumbed.
  ;; Effect: remove old dominance, establish new dominance, record that challenger overcame defender.
  (:action overcome
    :parameters (?challenger - creature ?defender - creature)
    :precondition (and
      (alive ?challenger)
      (alive ?defender)
      (dominating ?defender ?challenger)
      (not (succumbed ?challenger))
    )
    :effect (and
      (not (dominating ?defender ?challenger))
      (dominating ?challenger ?defender)
      (overcame ?challenger ?defender)
    )
  )

  ;; feast: predator consumes prey. Must only occur after dominance and succumb.
  ;; Precondition: both alive, predator dominates prey, prey has succumbed.
  ;; Effect: prey is no longer alive and predator comes to crave that specific prey (craves is required goal).
  ;; This action encodes the hard constraint that feasting cannot occur without prior dominance and succumb.
  (:action feast
    :parameters (?predator - creature ?prey - creature)
    :precondition (and
      (alive ?predator)
      (alive ?prey)
      (dominating ?predator ?prey)
      (succumbed ?prey)
    )
    :effect (and
      (not (alive ?prey))
      (craves ?predator ?prey)
    )
  )
)