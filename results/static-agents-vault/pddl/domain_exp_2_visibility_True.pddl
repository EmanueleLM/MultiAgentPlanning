(define (domain vault-domain)
  (:requirements :typing :strips :negative-preconditions)

  (:types agent place key object)

  (:constants
    outside vault1
    key1
    obj1
    - place)

  (:predicates
    (at          ?a - agent  ?p - place)
    (door-closed ?p - place)
    (door-open   ?p - place)
    (has-key     ?a - agent  ?k - key)
    (can-enter   ?a - agent  ?p - place)
    (cannot-grab ?a - agent  ?p - place)
    (has-object  ?a - agent  ?o - object)
    (in          ?o - object ?p - place))

  (:action transfer-key
    :parameters (?from - agent  ?to - agent  ?k - key)
    :precondition (and
                    (has-key ?from ?k)
                    (not (has-key ?to ?k)))
    :effect (and
              (has-key ?to ?k)
              (not (has-key ?from ?k))) )

  (:action open-vault
    :parameters (?a - agent  ?p - place  ?k - key)
    :precondition (and
                    (at ?a outside)
                    (has-key ?a ?k)
                    (door-closed ?p))
    :effect (and
              (door-open ?p)
              (not (door-closed ?p))) )

  (:action enter
    :parameters (?a - agent  ?p - place)
    :precondition (and
                    (at ?a outside)
                    (door-open ?p)
                    (can-enter ?a ?p))
    :effect (and
              (at ?a ?p)
              (not (at ?a outside))) )

  (:action leave
    :parameters (?a - agent  ?p - place)
    :precondition (at ?a ?p)
    :effect (and
              (at ?a outside)
              (not (at ?a ?p))) )

  (:action grab-object
    :parameters (?a - agent  ?o - object  ?p - place)
    :precondition (and
                    (at ?a ?p)
                    (in ?o ?p)
                    (not (cannot-grab ?a ?p)))
    :effect (and
              (has-object ?a ?o)
              (not (in ?o ?p))) ))