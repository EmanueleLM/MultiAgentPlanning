(define (domain vault-coop-domain)
  (:requirements :strips :typing)
  (:types robot vault key object location)
  (:predicates
    (big ?r - robot)
    (small ?r - robot)
    (closed ?v - vault)
    (open ?v - vault)
    (at ?r - robot ?l - location)
    (has-key ?r - robot ?k - key)
    (object-in ?o - object ?v - vault)
    (grabbed ?o - object)
    (entrance-small ?v - vault))
  (:action open-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
                    (at ?r entrance)
                    (closed ?v)
                    (has-key ?r)
                    (entrance-small ?v))
    :effect (and
              (not (closed ?v))
              (open ?v)))
  (:action enter-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
                    (at ?r entrance)
                    (open ?v)
                    (small ?r)
                    (entrance-small ?v))
    :effect (and
              (at ?r vaultroom)
              (not (at ?r entrance))))
  (:action grab-object
    :parameters (?r - robot ?o - object ?v - vault)
    :precondition (and
                    (at ?r vaultroom)
                    (object-in ?o ?v)
                    (not (grabbed ?o)))
    :effect (and
              (grabbed ?o)
              (not (object-in ?o ?v))) ))
