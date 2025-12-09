(define (domain craving-conflict)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent step province planet)

  (:predicates
    (agent ?x - agent)
    (step ?s - step)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
    (attacked ?att - agent ?tgt - agent)
    (pain ?x - agent)
    (craves ?x - agent ?y - agent)
    (harmony ?x - agent)
    (province ?p - province)
    (planet ?pl - planet)
  )

  ;; Attack: an agent attacks another agent during a specific step.
  ;; Preconditions:
  ;;   - the plan is at the given current step
  ;;   - the step has a defined successor
  ;;   - this exact attack has not already been recorded
  ;; Effects:
  ;;   - record the attack (attacked ?att ?tgt)
  ;;   - inflict pain on the target (pain ?tgt)
  ;;   - advance the current step to the successor
  (:action Attack
    :parameters (?att - agent ?tgt - agent ?s - step ?s2 - step)
    :precondition (and
      (agent ?att)
      (agent ?tgt)
      (current ?s)
      (next ?s ?s2)
      (not (attacked ?att ?tgt))
    )
    :effect (and
      (attacked ?att ?tgt)
      (pain ?tgt)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Succumb: a target succumbs to an attacker previously recorded.
  ;; Preconditions:
  ;;   - current step and its successor
  ;;   - there is an outstanding attack from ?att against ?tgt
  ;;   - the target is in pain
  ;;   - the target is not already in harmony (cannot succumb if harmony established)
  ;;   - the craving does not already hold
  ;; Effects:
  ;;   - produce the craving (craves ?tgt ?att)
  ;;   - remove pain and the outstanding attacked record
  ;;   - advance the current step
  (:action Succumb
    :parameters (?tgt - agent ?att - agent ?s - step ?s2 - step)
    :precondition (and
      (agent ?att)
      (agent ?tgt)
      (current ?s)
      (next ?s ?s2)
      (attacked ?att ?tgt)
      (pain ?tgt)
      (not (harmony ?tgt))
      (not (craves ?tgt ?att))
    )
    :effect (and
      (craves ?tgt ?att)
      (not (pain ?tgt))
      (not (attacked ?att ?tgt))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Overcome: an agent overcomes pain and moves into harmony.
  ;; Preconditions:
  ;;   - current step and its successor
  ;;   - the agent is in pain
  ;;   - agent is not already in harmony
  ;; Effects:
  ;;   - remove pain and set harmony
  ;;   - advance the current step
  (:action Overcome
    :parameters (?x - agent ?s - step ?s2 - step)
    :precondition (and
      (agent ?x)
      (current ?s)
      (next ?s ?s2)
      (pain ?x)
      (not (harmony ?x))
    )
    :effect (and
      (harmony ?x)
      (not (pain ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Feast: an agent feasts and thereby forms a craving toward a victim.
  ;; Preconditions:
  ;;   - current step and its successor
  ;;   - the victim is not currently in pain (feast does not require prior pain)
  ;; Effects:
  ;;   - create a craving from eater to victim
  ;;   - advance the current step
  (:action Feast
    :parameters (?e - agent ?v - agent ?s - step ?s2 - step)
    :precondition (and
      (agent ?e)
      (agent ?v)
      (current ?s)
      (next ?s ?s2)
      (not (pain ?v))
    )
    :effect (and
      (craves ?e ?v)
      (not (current ?s))
      (current ?s2)
    )
  )
)