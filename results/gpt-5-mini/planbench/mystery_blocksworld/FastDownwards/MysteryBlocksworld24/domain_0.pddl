(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent obj)

  (:predicates
    ; object facts
    (available ?o - obj)
    (free-craver ?o - obj)           ; object may establish exactly one craving at a time
    (craves ?o1 - obj ?o2 - obj)     ; primary goal relation: object o1 craves object o2

    ; agent identity (static, set in the problem)
    (attacker-agent ?a - agent)
    (feaster-agent ?a - agent)

    ; causal bookkeeping (preserve agent distinctions)
    (attacked ?a - agent ?o - obj)
    (feasted ?a - agent ?o - obj)
    (caused-by ?o1 - obj ?o2 - obj ?a - agent)
  )

  ; Action by attacker agent that makes object ?x crave object ?y
  (:action attacker-attack
    :parameters (?att - agent ?x - obj ?y - obj)
    :precondition (and
      (attacker-agent ?att)
      (available ?x)
      (available ?y)
      (free-craver ?x)
      (not (craves ?x ?y))
      (not (= ?x ?y))
    )
    :effect (and
      (craves ?x ?y)
      (not (free-craver ?x))
      (attacked ?att ?x)
      (caused-by ?x ?y ?att)
    )
  )

  ; Action by feaster agent that makes object ?x crave object ?y
  (:action feaster-feast
    :parameters (?f - agent ?x - obj ?y - obj)
    :precondition (and
      (feaster-agent ?f)
      (available ?x)
      (available ?y)
      (free-craver ?x)
      (not (craves ?x ?y))
      (not (= ?x ?y))
    )
    :effect (and
      (craves ?x ?y)
      (not (free-craver ?x))
      (feasted ?f ?x)
      (caused-by ?x ?y ?f)
    )
  )

  ; Explicit action to clear a craving (satiation) only if created; enforces that cravings are explicit outcomes, no penalty shortcuts.
  (:action satiate-clear
    :parameters (?a - agent ?x - obj ?y - obj)
    :precondition (and
      (available ?x)
      (available ?y)
      (craves ?x ?y)
      (caused-by ?x ?y ?a)
    )
    :effect (and
      (not (craves ?x ?y))
      (free-craver ?x)
      (not (caused-by ?x ?y ?a))
      ; do not remove attacked/feasted records: they are historical and represent causal distinction
    )
  )
)