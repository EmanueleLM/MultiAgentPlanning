(define (domain vault_domain)
  (:requirements :strips :typing)

  (:types
    robot    - object
    key      - object
    vault    - object
    item     - object
    location - object
  )

  (:predicates
    (big      ?r - robot)
    (small    ?r - robot)
    (has-key  ?r - robot ?k - key)
    (vault-closed ?v - vault)
    (vault-open   ?v - vault)
    (robot-at    ?r - robot   ?l - location)
    (key-at      ?k - key     ?l - location)
    (inside      ?r - robot   ?v - vault)
    (has-item    ?r - robot   ?o - item)
    (object-inside ?o - item ?v - vault)
  )

  (:action open-vault
    :parameters (?r - robot ?v - vault ?l - location ?k - key)
    :precondition (and
                    (robot-at    ?r ?l)
                    (vault-closed ?v)
                    (has-key     ?r ?k)
                    (key-at      ?k ?l))
    :effect (and
              (not (vault-closed ?v))
              (vault-open ?v)))  

  (:action enter-vault
    :parameters (?r - robot ?v - vault ?l - location)
    :precondition (and
                    (robot-at ?r ?l)
                    (vault-open ?v)
                    (small ?r))
    :effect (inside ?r ?v))  

  (:action grab-object
    :parameters (?r - robot ?o - item ?v - vault)
    :precondition (and
                    (inside ?r ?v)
                    (object-inside ?o ?v))
    :effect (and
              (has-item ?r ?o)
              (not (object-inside ?o ?v))) )  
)