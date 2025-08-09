(define (domain vault-domain)
  (:requirements :typing :strips)
  (:types
    agent - object
    vault - object
    key - object
    object - object)
  (:predicates
    (closed ?v - vault)
    (opened ?v - vault)
    (has-key ?a - agent ?k - key)
    (can-enter ?a - agent ?v - vault)
    (inside ?a - agent ?v - vault)
    (object-in ?o - object ?v - vault)
    (has-object ?a - agent ?o - object))
  (:action get-key-from-A
    :parameters (?from - agent ?to - agent ?k - key)
    :precondition (and
                    (has-key ?from ?k)
                    (not (has-key ?to ?k)))
    :effect (and
                (not (has-key ?from ?k))
                (has-key ?to ?k)))
  (:action open-vault
    :parameters (?a - agent ?v - vault ?k - key)
    :precondition (and
                    (has-key ?a ?k)
                    (closed ?v))
    :effect (and
                (not (closed ?v))
                (opened ?v)))
  (:action enter-vault
    :parameters (?a - agent ?v - vault)
    :precondition (and
                    (opened ?v)
                    (can-enter ?a ?v)
                    (not (inside ?a ?v)))
    :effect (inside ?a ?v))
  (:action pickup-from-vault
    :parameters (?a - agent ?o - object ?v - vault)
    :precondition (and
                    (inside ?a ?v)
                    (object-in ?o ?v)
                    (not (has-object ?a ?o)))
    :effect (and
                (has-object ?a ?o)
                (not (object-in ?o ?v)))) )