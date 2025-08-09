(define (domain vault-domain)
  (:requirements :typing :strips)
  (:types agent object)
  (:predicates
    (has ?a - agent ?i - object)
    (small ?a - agent)
    (vault-closed)
    (vault-open)
    (inside-vault ?a - agent))
  (:action give-key
    :parameters (?a ?b - agent ?k ?o - object)
    :precondition (and
                    (has ?a ?k)
                    (not (has ?b ?k)))
    :effect (and
              (has ?b ?k)
              (not (has ?a ?k))))
  (:action open-vault
    :parameters (?b - agent ?k ?o - object)
    :precondition (and
                    (has ?b ?k)
                    (vault-closed))
    :effect (and
              (vault-open)
              (not (vault-closed))))
  (:action enter-vault
    :parameters (?b - agent ?k ?o - object)
    :precondition (and
                    (vault-open)
                    (small ?b))
    :effect (inside-vault ?b))
  (:action grab-object
    :parameters (?b - agent ?k ?o - object)
    :precondition (and
                    (vault-open)
                    (inside-vault ?b))
    :effect (has ?b ?o)))
