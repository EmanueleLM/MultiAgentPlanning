(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (connected ?x - object ?y - object)
    (holder ?x - object)
    (feline ?x - object)
    (surface ?x - object)
    (vaselike ?x - object ?y - object)
    (sneezy ?x - object)
    (springlike ?x - object)
    (stupendous ?x - object)
    (collects ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (holder ?o0) (feline ?o1) (surface ?o2) (vaselike ?o0 ?o1) (connected ?o1 ?o2))
    :effect (and (connected ?o0 ?o2) (not (vaselike ?o0 ?o1)))
  )

  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (holder ?o0) (feline ?o1) (surface ?o2) (connected ?o0 ?o2) (connected ?o1 ?o2))
    :effect (and (vaselike ?o0 ?o1) (not (connected ?o0 ?o2)))
  )

  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (holder ?o0) (sneezy ?o1) (surface ?o2) (connected ?o1 ?o2) (connected ?o0 ?o2))
    :effect (and (vaselike ?o0 ?o1) (not (connected ?o0 ?o2)))
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and (sneezy ?o0) (surface ?o1) (surface ?o2) (stupendous ?o3) (connected ?o0 ?o1) (collects ?o1 ?o3) (collects ?o2 ?o3))
    :effect (and (connected ?o0 ?o2) (not (connected ?o0 ?o1)))
  )

  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (feline ?o0) (springlike ?o1) (springlike ?o2) (connected ?o0 ?o1))
    :effect (and (connected ?o0 ?o2) (not (connected ?o0 ?o1)))
  )

  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (holder ?o0) (sneezy ?o1) (surface ?o2) (connected ?o1 ?o2) (vaselike ?o0 ?o1))
    :effect (and (connected ?o0 ?o2) (not (vaselike ?o0 ?o1)))
  )
)