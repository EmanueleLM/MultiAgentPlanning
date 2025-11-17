(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item location)

  ;; Predicates
  (:predicates
    (at ?a - agent ?l - location)            ; agent a is at location l
    (item-at ?i - item ?l - location)        ; item i is at location l
    (holding ?a - agent ?i - item)           ; agent a is holding item i
    (free ?a - agent)                        ; agent a's hands are free (not holding any item)
    (picked ?i - item)                       ; item i has been picked up at least once
    (transported ?i - item)                  ; item i has been placed at a transport/assembly location
    (assembled ?i - item)                    ; item i has been assembled (terminal done condition)
  )

  ;; Actions belonging to loader-type agents (prefix: loader_)
  ;; Loader picks up an item at its current location. Requires the agent to be free.
  (:action loader_pick
    :parameters (?a - agent ?i - item ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (item-at ?i ?l)
                    (free ?a)
                    (not (picked ?i))
                  )
    :effect (and
              (not (item-at ?i ?l))
              (holding ?a ?i)
              (not (free ?a))
              (picked ?i)
            )
  )

  ;; Loader moves between locations. Movement is allowed whether free or holding an item (explicit).
  (:action loader_move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
                    (at ?a ?from)
                  )
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )

  ;; Loader places the item at the current location, marking it transported.
  ;; This action requires the loader to be holding the specific item.
  (:action loader_place
    :parameters (?a - agent ?i - item ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (holding ?a ?i)
                    (not (transported ?i))
                  )
    :effect (and
              (not (holding ?a ?i))
              (free ?a)
              (item-at ?i ?l)
              (transported ?i)
            )
  )

  ;; Actions belonging to assembler-type agents (prefix: assembler_)
  ;; Assembler moves between locations.
  (:action assembler_move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
                    (at ?a ?from)
                  )
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )

  ;; Assembler performs assembly on an item. Requires the item to be transported to
  ;; the assembler's current location and not already assembled.
  ;; This enforces the strict order: picked -> transported -> assembled.
  (:action assembler_assemble
    :parameters (?a - agent ?i - item ?l - location)
    :precondition (and
                    (at ?a ?l)
                    (item-at ?i ?l)
                    (transported ?i)
                    (not (assembled ?i))
                  )
    :effect (and
              (assembled ?i)
            )
  )

)