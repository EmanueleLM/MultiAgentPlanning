(define (domain multi_agent_inspection)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object place memory)
  (:predicates
    (at ?a - agent ?p - place)
    (obj-at ?o - object ?p - place)
    (holding ?a - agent ?o - object)
    (clipped ?o - object)
    (broken ?o - object)
    (drinkable ?o - object)
    (drunk ?o - object)
    (remembered ?a - agent ?m - memory)
    (tight ?a - agent)
    (paltry-item ?o - object)
  )

  ;; Public action: paltry
  ;; semantics: agent picks up a (paltry/small) object at its location
  (:action paltry
    :parameters (?a - agent ?o - object ?p - place)
    :precondition (and
      (at ?a ?p)
      (obj-at ?o ?p)
      (paltry-item ?o)
    )
    :effect (and
      (holding ?a ?o)
      (not (obj-at ?o ?p))
    )
  )

  ;; Public action: sip
  ;; semantics: agent drinks from a drinkable object at its location
  (:action sip
    :parameters (?a - agent ?c - object ?p - place)
    :precondition (and
      (at ?a ?p)
      (obj-at ?c ?p)
      (drinkable ?c)
    )
    :effect (and
      (drunk ?c)
      (not (drinkable ?c))
    )
  )

  ;; Public action: clip
  ;; semantics: agent uses a clip-object it holds to clip/attach to another object at the same place
  (:action clip
    :parameters (?a - agent ?clip - object ?o - object ?p - place)
    :precondition (and
      (at ?a ?p)
      (obj-at ?o ?p)
      (holding ?a ?clip)
    )
    :effect (and
      (clipped ?o)
      (not (holding ?a ?clip))
    )
  )

  ;; Public action: wretched
  ;; semantics: agent makes an object wretched/broken at the same location
  (:action wretched
    :parameters (?a - agent ?o - object ?p - place)
    :precondition (and
      (at ?a ?p)
      (obj-at ?o ?p)
    )
    :effect (and
      (broken ?o)
    )
  )

  ;; Public action: memory
  ;; semantics: agent records/creates a memory tag (only if not already remembered)
  (:action memory
    :parameters (?a - agent ?m - memory)
    :precondition (and
      (not (remembered ?a ?m))
    )
    :effect (and
      (remembered ?a ?m)
    )
  )

  ;; Public action: tightfisted
  ;; semantics: agent becomes tightfisted (only if not already)
  (:action tightfisted
    :parameters (?a - agent)
    :precondition (and
      (not (tight ?a))
    )
    :effect (and
      (tight ?a)
    )
  )
)