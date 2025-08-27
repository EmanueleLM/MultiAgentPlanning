(define (domain cooperative-vault-domain)
  (:requirements :strips :typing)

  (:types 
    robot key vault object)

  (:predicates
    ;; From Agent 1
    (has-key ?r - robot ?k - key)
    (vault-closed ?v - vault)
    (holding ?r - robot ?o - object)
    (grabbed-object ?v - vault ?o - object)
    (is-small ?v - vault)
    (is-big ?r - robot)

    ;; From Agent 2
    (vault-open)

    ;; Common predicates
    (is-small ?r - robot)  ;; Attribute for Agent 2
    (key-found)            ;; Used to record key status
    (object-grabbed)
    (object-inside ?v - vault ?o - object)
  )

  ;; Actions for Agent 1
  (:action agent1-open-vault
    :parameters (?r - robot ?v - vault ?k - key)
    :precondition (and (vault-closed ?v) (has-key ?r ?k))
    :effect (and (not (vault-closed ?v)) (vault-open))
  )
  
  ;; Actions for Agent 2
  (:action agent2-grab-object
    :parameters (?r - robot ?v - vault ?o - object)
    :precondition (and (vault-open) (object-inside ?v ?o) (is-small ?r))
    :effect (and (not (object-inside ?v ?o)) (object-grabbed) (holding ?r ?o))
  )
)