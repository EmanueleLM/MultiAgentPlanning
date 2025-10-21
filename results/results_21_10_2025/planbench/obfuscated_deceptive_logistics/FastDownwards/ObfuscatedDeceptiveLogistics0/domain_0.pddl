(define (domain orchestrated_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (next ?a - obj ?b - obj)         ; link from one object to another (goal predicate)
    (free ?o - obj)                  ; object is free/available to be linked
    (marked ?o - obj)                ; temporary mark on an object
    (remembered ?o - obj)            ; object is remembered (can be target of clip)
    (tightblocked ?o - obj)          ; object is blocked/tightfisted
  )

  ;; paltry: mark a free object (consumes its free-ness)
  (:action paltry
    :parameters (?x - obj)
    :precondition (and (free ?x) (not (marked ?x)))
    :effect (and (marked ?x) (not (free ?x)))
  )

  ;; sip: convert a mark into a remembered state
  (:action sip
    :parameters (?x - obj)
    :precondition (marked ?x)
    :effect (and (remembered ?x) (not (marked ?x)))
  )

  ;; clip: create a next relation from a free source to a remembered target
  (:action clip
    :parameters (?src - obj ?tgt - obj)
    :precondition (and (free ?src) (remembered ?tgt) (not (tightblocked ?src)))
    :effect (and (next ?src ?tgt) (not (free ?src)))
  )

  ;; wretched: remove an existing next link and mark the source as tightblocked
  (:action wretched
    :parameters (?src - obj ?tgt - obj)
    :precondition (and (next ?src ?tgt))
    :effect (and (tightblocked ?src) (not (next ?src ?tgt)))
  )

  ;; memory: recover a tightblocked object into remembered (unblock -> remembered)
  (:action memory
    :parameters (?x - obj)
    :precondition (tightblocked ?x)
    :effect (and (remembered ?x) (not (tightblocked ?x)))
  )

  ;; tightfisted: consume a free object and make it tightblocked (prevents being used as source)
  (:action tightfisted
    :parameters (?x - obj)
    :precondition (free ?x)
    :effect (and (tightblocked ?x) (not (free ?x)))
  )
)