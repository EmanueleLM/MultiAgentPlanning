(define (domain social-interactions)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent)

  (:predicates
    (alive ?x - agent)
    (attacked ?attacker - agent ?target - agent)
    (succumbed ?target - agent ?attacker - agent)
    (overcame ?attacker - agent ?target - agent)
    (feasted ?eater - agent ?food - agent)
    (craves ?x - agent ?y - agent)
  )

  ;; Attack: attacker makes an attack action against target.
  ;; Ordering constraint: Attack must occur before Succumb for the same pair,
  ;; enforced by Succumb's precondition.
  (:action Attack
    :parameters (?attacker - agent ?target - agent)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (not (attacked ?attacker ?target))
    )
    :effect (and
      (attacked ?attacker ?target)
    )
  )

  ;; Succumb: target succumbs to attacker; requires a prior Attack(attacker,target).
  ;; Effect: record the succumbing and make the target crave the attacker.
  (:action Succumb
    :parameters (?target - agent ?attacker - agent)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (attacked ?attacker ?target)
      (not (succumbed ?target ?attacker))
    )
    :effect (and
      (succumbed ?target ?attacker)
      (craves ?target ?attacker)
    )
  )

  ;; Overcome: attacker is recorded as having overcome target.
  ;; Requires both Attack and Succumb in that order for the same pair.
  (:action Overcome
    :parameters (?attacker - agent ?target - agent)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (attacked ?attacker ?target)
      (succumbed ?target ?attacker)
      (not (overcame ?attacker ?target))
    )
    :effect (and
      (overcame ?attacker ?target)
    )
  )

  ;; Feast: eater feasts on food after overcoming it.
  ;; Requires Overcome(eater,food) so the sequence Attack -> Succumb -> Overcome -> Feast
  ;; is enforced when Feast is used.
  (:action Feast
    :parameters (?eater - agent ?food - agent)
    :precondition (and
      (alive ?eater)
      (alive ?food)
      (overcame ?eater ?food)
      (not (feasted ?eater ?food))
    )
    :effect (and
      (feasted ?eater ?food)
    )
  )
)