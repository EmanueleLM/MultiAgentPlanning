(define (domain synthesized_domain_from_inspector_and_auditor)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent obj loc slot texture_type idx)

  ;; Predicates (as specified in the canonical specification)
  (:predicates
    (at ?o - obj ?l - loc)
    (holding ?ag - agent ?o - obj)
    (handempty ?ag - agent)
    (slot_free ?s - slot)
    (occupant ?s - slot ?o - obj)
    (collected ?o - obj)
    (attached ?a - obj ?b - obj)
    (predecessor ?a - obj ?b - obj)
    (position ?o - obj ?i - idx)
    (current_target ?o - obj)
    (is_vase ?o - obj)
    (is_spring ?o - obj)
    (is_cat ?o - obj)
    (has_texture ?o - obj ?t - texture_type)
    (sneeze_flag ?o - obj)
    (stupendous_flag ?o - obj)
    (reachable ?ag - agent ?l - loc)
  )

  ;; Action: sip (pick up an object from a location)
  (:action sip
    :parameters (?ag - agent ?o - obj ?from - loc)
    :precondition (and
      (at ?o ?from)
      (handempty ?ag)
      (reachable ?ag ?from)
    )
    :effect (and
      (holding ?ag ?o)
      (not (at ?o ?from))
      (not (handempty ?ag))
    )
  )

  ;; Action: paltry (put down an object to a location)
  (:action paltry
    :parameters (?ag - agent ?o - obj ?l - loc)
    :precondition (and
      (holding ?ag ?o)
      (reachable ?ag ?l)
    )
    :effect (and
      (at ?o ?l)
      (handempty ?ag)
      (not (holding ?ag ?o))
    )
  )

  ;; Action: clip (attach object A to object B)
  (:action clip
    :parameters (?ag - agent ?a - obj ?b - obj)
    :precondition (and
      (holding ?ag ?a)
      (reachable ?ag ?b)
    )
    :effect (and
      (attached ?a ?b)
      (handempty ?ag)
      (not (holding ?ag ?a))
    )
  )

  ;; Action: wretched (use a held tool to move an object from a known source loc to a destination loc)
  ;; Note: expanded to include source location explicitly to permit sound deletes of the previous at(...) fact.
  (:action wretched
    :parameters (?ag - agent ?tool - obj ?o - obj ?from - loc ?to - loc)
    :precondition (and
      (holding ?ag ?tool)
      (at ?o ?from)
      (reachable ?ag ?to)
    )
    :effect (and
      (at ?o ?to)
      (not (at ?o ?from))
    )
  )

  ;; Action: memory (store an object into a free memory slot)
  (:action memory
    :parameters (?ag - agent ?o - obj ?s - slot)
    :precondition (and
      (slot_free ?s)
      (not (collected ?o))
      (reachable ?ag ?s)
    )
    :effect (and
      (occupant ?s ?o)
      (collected ?o)
      (not (slot_free ?s))
    )
  )

  ;; Action: tightfisted (release an occupant object from a slot to a location)
  ;; expanded to include the occupant object explicitly
  (:action tightfisted
    :parameters (?ag - agent ?s - slot ?o - obj ?loc - loc)
    :precondition (and
      (occupant ?s ?o)
      (reachable ?ag ?loc)
    )
    :effect (and
      (slot_free ?s)
      (at ?o ?loc)
      (not (occupant ?s ?o))
    )
  )
)