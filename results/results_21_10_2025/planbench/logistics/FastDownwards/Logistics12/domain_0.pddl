(define (domain orchestrated-multiagent)
  :requirements :strips :typing :negative-preconditions
  :types agent item tool coin cup loc event

  :predicates
    (at ?a - agent ?l - loc)
    (at-cup ?c - cup ?l - loc)
    (has-coin ?a - agent ?c - coin)
    (has-tool ?a - agent ?t - tool)
    (has-cup ?a - agent ?c - cup)
    (thirsty ?a - agent)
    (paltry-done ?a - agent)
    (wretched ?a - agent)
    (tightfisted ?a - agent)
    (happened ?e - event)
    (remembers ?a - agent ?e - event)
    (clipped ?it - item)
  )

  ; paltry: agent uses a coin to perform the paltry action which produces an event and consumes the coin
  (:action paltry
    :parameters (?ag - agent ?c - coin ?e - event)
    :precondition (and
      (has-coin ?ag ?c)
    )
    :effect (and
      (paltry-done ?ag)
      (happened ?e)
      (not (has-coin ?ag ?c))
    )
  )

  ; sip: agent drinks from a cup at the same location to remove thirst
  (:action sip
    :parameters (?ag - agent ?cup - cup ?loc - loc)
    :precondition (and
      (at ?ag ?loc)
      (at-cup ?cup ?loc)
      (thirsty ?ag)
    )
    :effect (and
      (not (thirsty ?ag))
    )
  )

  ; clip: agent uses a tool to clip an item; item must not already be clipped
  (:action clip
    :parameters (?ag - agent ?t - tool ?it - item)
    :precondition (and
      (has-tool ?ag ?t)
      (not (clipped ?it))
    )
    :effect (and
      (clipped ?it)
      (not (has-tool ?ag ?t))
    )
  )

  ; wretched: marks an agent as wretched after paltry has occurred for that agent
  (:action wretched
    :parameters (?ag - agent)
    :precondition (and
      (paltry-done ?ag)
      (not (wretched ?ag))
    )
    :effect (and
      (wretched ?ag)
    )
  )

  ; memory: observer records (remembers) an event if it has happened
  (:action memory
    :parameters (?obs - agent ?e - event)
    :precondition (and
      (happened ?e)
      (not (remembers ?obs ?e))
    )
    :effect (and
      (remembers ?obs ?e)
    )
  )

  ; tightfisted: becomes tightfisted if paltry-done and wretched both hold for the agent
  (:action tightfisted
    :parameters (?ag - agent)
    :precondition (and
      (paltry-done ?ag)
      (wretched ?ag)
      (not (tightfisted ?ag))
    )
    :effect (and
      (tightfisted ?ag)
    )
  )
)