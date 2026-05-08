(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types creature)
  (:predicates
    (alive ?c - creature)
    (attacked ?victim ?attacker - creature)
    (succumbed ?victim ?attacker - creature)
    (overcame ?winner ?loser - creature)
    (feasted ?eater ?prey - creature)
    (craves ?subject ?object - creature)
  )

  ;; Action: Attack
  ;; Attacker and target must be alive. Produces an "attacked" relation
  ;; (victim attacked-by attacker) and makes the attacker crave the target.
  (:action Attack
    :parameters (?attacker - creature ?target - creature)
    :precondition (and
      (alive ?attacker)
      (alive ?target)
      (not (attacked ?target ?attacker))
    )
    :effect (and
      (attacked ?target ?attacker)
      (craves ?attacker ?target)
    )
  )

  ;; Action: Succumb
  ;; A victim who has been attacked by an attacker may succumb, causing the victim to crave the attacker.
  (:action Succumb
    :parameters (?victim - creature ?attacker - creature)
    :precondition (and
      (alive ?victim)
      (attacked ?victim ?attacker)
      (not (succumbed ?victim ?attacker))
    )
    :effect (and
      (succumbed ?victim ?attacker)
      (craves ?victim ?attacker)
    )
  )

  ;; Action: Overcome
  ;; After a victim has succumbed to a winner, the winner may overcome the victim, which removes the victim's aliveness.
  (:action Overcome
    :parameters (?winner - creature ?loser - creature)
    :precondition (and
      (alive ?winner)
      (alive ?loser)
      (succumbed ?loser ?winner)
      (not (overcame ?winner ?loser))
    )
    :effect (and
      (overcame ?winner ?loser)
      (not (alive ?loser))
    )
  )

  ;; Action: Feast
  ;; After a winner has overcome a loser (loser no longer alive), the winner may feast on the loser.
  (:action Feast
    :parameters (?eater - creature ?prey - creature)
    :precondition (and
      (overcame ?eater ?prey)
      (not (feasted ?eater ?prey))
      (not (alive ?prey))
    )
    :effect (and
      (feasted ?eater ?prey)
    )
  )
)