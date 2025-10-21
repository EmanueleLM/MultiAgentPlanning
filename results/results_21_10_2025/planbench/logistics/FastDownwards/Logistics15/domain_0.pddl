(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc item)

  (:predicates
    (at ?a - agent ?l - loc)
    (available ?i - item)
    (has ?a - agent ?i - item)
    (clipped ?i - item)
    (satiated ?a - agent)
    (remembered ?a - agent ?m - item)
    (wretched ?i - item)
    (tight ?a - agent)
  )

  ;; Action: paltry
  ;; Agent picks up an available small resource (paltry). The resource becomes held and no longer available.
  (:action paltry
    :parameters (?a - agent ?r - item ?l - loc)
    :precondition (and
      (at ?a ?l)
      (available ?r)
      (not (has ?a ?r))
    )
    :effect (and
      (has ?a ?r)
      (not (available ?r))
    )
  )

  ;; Action: sip
  ;; Agent consumes a drink (or consumable item). After sipping, the agent becomes satiated and no longer has the consumable.
  (:action sip
    :parameters (?a - agent ?d - item)
    :precondition (and
      (has ?a ?d)
      (not (satiated ?a))
    )
    :effect (and
      (satiated ?a)
      (not (has ?a ?d))
    )
  )

  ;; Action: clip
  ;; Agent uses a tool to clip/attach an item. Requires both the item to be clipped and a tool in the agent's possession.
  (:action clip
    :parameters (?a - agent ?i - item ?t - item)
    :precondition (and
      (has ?a ?i)
      (has ?a ?t)
      (not (clipped ?i))
    )
    :effect (and
      (clipped ?i)
    )
  )

  ;; Action: wretched
  ;; Agent marks or disposes an item as wretched; the agent no longer holds it and it is flagged as wretched.
  (:action wretched
    :parameters (?a - agent ?i - item)
    :precondition (and
      (has ?a ?i)
    )
    :effect (and
      (wretched ?i)
      (not (has ?a ?i))
    )
  )

  ;; Action: memory
  ;; Agent encodes/records an item as remembered if they possess the memory token/item.
  (:action memory
    :parameters (?a - agent ?m - item)
    :precondition (and
      (has ?a ?m)
      (not (remembered ?a ?m))
    )
    :effect (and
      (remembered ?a ?m)
    )
  )

  ;; Action: tightfisted
  ;; Agent becomes tightfisted while keeping possession of an item (hoards it). This is a state change on the agent.
  (:action tightfisted
    :parameters (?a - agent ?i - item)
    :precondition (and
      (has ?a ?i)
      (not (tight ?a))
    )
    :effect (and
      (tight ?a)
    )
  )
)