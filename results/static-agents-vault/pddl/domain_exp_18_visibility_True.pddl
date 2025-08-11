(define (domain vault-domain)
  (:requirements :strips :typing)

  (:types agent thing)

  (:predicates
    ;; Ownership
    (has ?a - agent ?t - thing)          ; agent ?a owns thing ?t

    ;; Vault state
    (open vault)                          ; only the object “vault” can be open

    ;; Spatial predicates
    (inside ?a - agent)                   ; agent is inside the vault
    (inside-thing ?o - thing)             ; thing is inside the vault

    ;; Size restriction (only robotB is small)
    (small ?a - agent)
    (cannot-enter ?a - agent)             ; agent is prohibited from entering the vault
  )

  (:action give-key
    :parameters (?from - agent ?to - agent ?key - thing)
    :precondition (has ?from ?key)
    :effect (and
              (has ?to ?key)
              (not (has ?from ?key))) )

  (:action open-vault
    :parameters (?a - agent ?k - thing)
    :precondition (and
                    (has ?a ?k)
                    (not (open vault)))
    :effect (open vault) )

  (:action enter-vault
    :parameters (?a - agent)
    :precondition (and
                    (open vault)
                    (small ?a)
                    (not (inside ?a))
                    (not (cannot-enter ?a)))
    :effect (inside ?a) )

  (:action grab-object
    :parameters (?a - agent ?obj - thing)
    :precondition (and
                    (inside ?a)
                    (inside-thing ?obj))
    :effect (and
              (has ?a ?obj)
              (not (inside-thing ?obj))) )
)