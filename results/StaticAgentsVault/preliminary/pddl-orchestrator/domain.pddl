(define (domain vault-domain)
  (:requirements :typing :strips :negative-preconditions)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Types
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:types agent location object)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Predicates
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:predicates
    ; Vault status
    (closed ?v - object)            ; vault is closed
    (open ?v - object)              ; vault is open

    ; Key possession
    (has-key ?a - agent)            ; agent owns the key

    ; Size of an agent
    (big ?a - agent)                ; too big to enter the vault
    (small ?a - agent)              ; small enough to enter

    ; Position of agents
    (at ?a - agent ?l - location)

    ; Where objects are (the vault itself is a location)
    (in ?o - object ?l - location)

    ; Who has the object we want
    (has-object ?a - agent)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Get the key from A – only if A currently owns it
  (:action get-key
    :parameters (?b - agent ?a - agent)
    :precondition (and
                    (has-key ?a)
                    (not (has-key ?b)))
    :effect (and
              (has-key ?b)
              (not (has-key ?a))) )

  ; Open the vault – any agent that has the key can do it
  (:action open-vault
    :parameters (?a - agent ?v - object)
    :precondition (and
                    (closed ?v)
                    (has-key ?a))
    :effect (and
              (open ?v)
              (not (closed ?v))) )

  ; Enter the vault – only a small agent can enter an open vault
  (:action enter-vault
    :parameters (?a - agent ?l - location)
    :precondition (and
                    (open ?l)                 ; the vault is open (location == vault)
                    (small ?a)
                    (at ?a outside)
                    (not (at ?a ?l)))
    :effect (and
              (at ?a ?l)
              (not (at ?a outside))) )

  ; Grab the object that is inside the vault
  (:action grab-object
    :parameters (?a - agent ?o - object ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (in ?o ?l))
    :effect (and
              (has-object ?a)
              (not (in ?o ?l))) )
)