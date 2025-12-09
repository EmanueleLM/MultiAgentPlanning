(define (domain craving-domain)
  (:requirements :strips :typing)
  (:types creature)

  (:predicates
    (alive ?c - creature)
    (can-attack ?a - creature ?b - creature)
    (attacked ?a - creature ?b - creature)
    (succumbed ?c - creature)
    (feasted ?x - creature ?y - creature)
    (craves ?x - creature ?y - creature)
  )

  ;; An agent attacks a target to place the target in an "attacked" state.
  (:action Attack
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (can-attack ?attacker ?target)
    )
    :effect (and
      (attacked ?attacker ?target)
    )
  )

  ;; Overcome is a distinct action that also results in the target being "attacked".
  (:action Overcome
    :parameters (?agent - creature ?opponent - creature)
    :precondition (and
      (alive ?agent)
      (alive ?opponent)
      (can-attack ?agent ?opponent)
    )
    :effect (and
      (attacked ?agent ?opponent)
    )
  )

  ;; A target succumbs only if it was attacked. Succumbing removes the attacked mark.
  (:action Succumb
    :parameters (?target - creature ?attacker - creature)
    :precondition (and
      (alive ?target)
      (attacked ?attacker ?target)
    )
    :effect (and
      (succumbed ?target)
      (not (attacked ?attacker ?target))
    )
  )

  ;; Feast requires the prey to have succumbed. Feast creates a craving relation.
  ;; Feast does not remove the prey's aliveness (the model enforces that feasting does not consume the prey).
  (:action Feast
    :parameters (?feaster - creature ?prey - creature)
    :precondition (and
      (alive ?feaster)
      (alive ?prey)
      (succumbed ?prey)
    )
    :effect (and
      (feasted ?feaster ?prey)
      (craves ?feaster ?prey)
    )
  )
)