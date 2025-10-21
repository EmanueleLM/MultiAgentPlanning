(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (next ?a ?b - object)
  )

  ;; paltry: create a direct next link from ?a to ?b if that exact link does not already exist
  (:action paltry
    :parameters (?a ?b - object)
    :precondition (not (next ?a ?b))
    :effect (next ?a ?b)
  )

  ;; sip: redirect an existing link from ?a->?old to ?a->?new
  (:action sip
    :parameters (?a ?old ?new - object)
    :precondition (next ?a ?old)
    :effect (and (not (next ?a ?old)) (next ?a ?new))
  )

  ;; clip: remove an existing next link ?a->?b
  (:action clip
    :parameters (?a ?b - object)
    :precondition (next ?a ?b)
    :effect (not (next ?a ?b))
  )

  ;; wretched: create a bidirectional link between ?a and ?b if the directed a->b does not already exist
  (:action wretched
    :parameters (?a ?b - object)
    :precondition (not (next ?a ?b))
    :effect (and (next ?a ?b) (next ?b ?a))
  )

  ;; memory: move a link from ?a->?old to ?a->?new (alias of a rewire operation)
  (:action memory
    :parameters (?a ?old ?new - object)
    :precondition (next ?a ?old)
    :effect (and (not (next ?a ?old)) (next ?a ?new))
  )

  ;; tightfisted: create a link ?a->?b only if the reverse link ?b->?a does NOT exist
  (:action tightfisted
    :parameters (?a ?b - object)
    :precondition (and (not (next ?a ?b)) (not (next ?b ?a)))
    :effect (next ?a ?b)
  )
)