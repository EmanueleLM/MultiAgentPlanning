(define (domain next-link-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (next ?from - object ?to - object)    ; link from ?from to ?to
    (assigned ?from - object)             ; true if ?from already has a next assigned
  )

  ; Action provided by the player agent: creates a next link from a source to a target,
  ; but only if the source has not already been assigned.
  (:action player-set-next
    :parameters (?from - object ?to - object)
    :precondition (not (assigned ?from))
    :effect (and
      (next ?from ?to)
      (assigned ?from)
    )
  )

  ; Action provided by the auditor agent: same capability, provenance preserved by name.
  (:action auditor-set-next
    :parameters (?from - object ?to - object)
    :precondition (not (assigned ?from))
    :effect (and
      (next ?from ?to)
      (assigned ?from)
    )
  )
)