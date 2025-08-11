(define (domain vault-orchestrated)
  (:requirements :strips :typing :negative-preconditions)

  (:types robot vault object loc - thing)

  (:predicates
    (closed ?v - vault)
    (opened ?v - vault)
    (at ?r - robot ?l - loc)
    (connected ?from - loc ?to - loc)
    (has-key ?r - robot ?v - vault)
    (has ?r - robot ?o - object)
    (at-obj ?o - object ?l - loc)
    (entrance-small)
    (robot-small ?r - robot)
    (robot-big ?r - robot)
  )

  (:action open-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
                    (closed ?v)
                    (has-key ?r ?v))
    :effect (and
             (not (closed ?v))
             (opened ?v)))

  (:action move
    :parameters (?r - robot ?from - loc ?to - loc)
    :precondition (and
                    (at ?r ?from)
                    (connected ?from ?to))
    :effect (and
             (not (at ?r ?from))
             (at ?r ?to)))

  (:action enter-vault
    :parameters (?r - robot ?v - vault ?e - loc ?inside - loc)
    :precondition (and
                    (at ?r ?e)
                    (opened ?v)
                    (entrance-small)
                    (robot-small ?r)
                    (connected ?e ?inside))
    :effect (and
             (not (at ?r ?e))
             (at ?r ?inside)))

  (:action grab-object
    :parameters (?r - robot ?o - object ?l - loc)
    :precondition (and
                    (at ?r ?l)
                    (at-obj ?o ?l))
    :effect (and
             (not (at-obj ?o ?l))
             (has ?r ?o))) 
)