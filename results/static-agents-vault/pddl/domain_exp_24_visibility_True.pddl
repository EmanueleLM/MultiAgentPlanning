(define (domain vault-orchestrator)
  (:requirements :typing :equality)
  (:types
    agent
    vault
    item)
  (:predicates
    (has ?a - agent ?i - item)
    (open ?v - vault)
    (inVault ?i - item)
    (insideVault ?a - agent)
    (small ?a - agent))
  (:action open-vault
    :parameters (?a - agent ?k - item ?v - vault)
    :precondition (and
                    (has ?a ?k)
                    (not (open ?v)))
    :effect (open ?v))
  (:action enter-vault
    :parameters (?a - agent ?v - vault)
    :precondition (and
                    (small ?a)
                    (not (insideVault ?a))
                    (open ?v))
    :effect (insideVault ?a))
  (:action grab
    :parameters (?a - agent ?i - item ?v - vault)
    :precondition (and
                    (= ?a agent_b)
                    (insideVault ?a)
                    (inVault ?i)
                    (open ?v))
    :effect (and
               (has ?a ?i)
               (not (inVault ?i)))) )