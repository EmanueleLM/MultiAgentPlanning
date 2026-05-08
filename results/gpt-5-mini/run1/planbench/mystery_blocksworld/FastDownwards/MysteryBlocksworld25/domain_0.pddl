(define (domain orchestrated)
  :requirements (:strips :typing :negative-preconditions)
  :types agent province planet

  :predicates
    (in-province ?x - agent ?p - province)
    (on-planet ?p - province ?pl - planet)
    (alive ?x - agent)
    (subdued ?x - agent)
    (pain ?x - agent)
    (harmony ?x - agent)
    (craves ?x - agent ?y - agent)
    (ready-for-succumb ?x - agent)
)

(:action Attack
  :parameters (?attacker - agent ?target - agent ?p - province)
  :precondition (and
    (alive ?attacker)
    (alive ?target)
    (in-province ?attacker ?p)
    (in-province ?target ?p)
    (not (subdued ?target))
  )
  :effect (and
    (pain ?target)
    (not (harmony ?target))
    (ready-for-succumb ?target)
  )
)

(:action Succumb
  :parameters (?victim - agent ?cause - agent ?p - province)
  :precondition (and
    (alive ?victim)
    (alive ?cause)
    (in-province ?victim ?p)
    (in-province ?cause ?p)
    (pain ?victim)
    (ready-for-succumb ?victim)
  )
  :effect (and
    (subdued ?victim)
    (craves ?victim ?cause)
    (not (pain ?victim))
    (not (ready-for-succumb ?victim))
  )
)

(:action Overcome
  :parameters (?winner - agent ?loser - agent ?p - province)
  :precondition (and
    (alive ?winner)
    (alive ?loser)
    (in-province ?winner ?p)
    (in-province ?loser ?p)
    (not (subdued ?loser))
    (not (pain ?winner))
  )
  :effect (and
    (subdued ?loser)
    (harmony ?winner)
    (craves ?loser ?winner)
  )
)

(:action Feast
  :parameters (?feaster - agent ?victim - agent ?p - province)
  :precondition (and
    (alive ?feaster)
    (alive ?victim)
    (in-province ?feaster ?p)
    (in-province ?victim ?p)
    (subdued ?victim)
  )
  :effect (and
    (not (alive ?victim))
    (not (subdued ?victim))
    (harmony ?feaster)
  )
)