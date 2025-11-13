(define (domain orchestrated_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item location)

  (:predicates
    (at ?a - agent ?l - location)            ; agent is at location
    (item-at ?i - item ?l - location)       ; item is at location
    (prepared ?i - item)                    ; item prepared by agent A
    (transported ?i - item)                 ; item transported by agent B
    (inspected ?i - item)                   ; item inspected by agent A
    (stored ?i - item)                      ; item stored by agent B
  )

  ; Agent A prepares an item at its current location.
  (:action prepare-by-A
    :parameters (?i - item ?l - location)
    :precondition (and
      (at object_0 ?l)
      (item-at ?i ?l)
      (not (prepared ?i))
    )
    :effect (and
      (prepared ?i)
    )
  )

  ; Agent B transports an item from one location to another.
  ; This action also moves agent B to the destination location.
  (:action transport-by-B
    :parameters (?i - item ?from - location ?to - location)
    :precondition (and
      (at object_1 ?from)
      (item-at ?i ?from)
      (prepared ?i)
      (not (transported ?i))
    )
    :effect (and
      (not (item-at ?i ?from))
      (item-at ?i ?to)
      (transported ?i)
      (not (at object_1 ?from))
      (at object_1 ?to)
    )
  )

  ; Agent A inspects an item at the location where the item currently is.
  (:action inspect-by-A
    :parameters (?i - item ?l - location)
    :precondition (and
      (at object_0 ?l)
      (item-at ?i ?l)
      (transported ?i)
      (not (inspected ?i))
    )
    :effect (and
      (inspected ?i)
    )
  )

  ; Agent B stores an inspected item at its current location.
  (:action store-by-B
    :parameters (?i - item ?l - location)
    :precondition (and
      (at object_1 ?l)
      (item-at ?i ?l)
      (inspected ?i)
      (not (stored ?i))
    )
    :effect (and
      (stored ?i)
    )
  )

  ; Movement actions for both agents so they can reach required locations.
  (:action move-A
    :parameters (?from - location ?to - location)
    :precondition (and
      (at object_0 ?from)
    )
    :effect (and
      (not (at object_0 ?from))
      (at object_0 ?to)
    )
  )

  (:action move-B
    :parameters (?from - location ?to - location)
    :precondition (and
      (at object_1 ?from)
    )
    :effect (and
      (not (at object_1 ?from))
      (at object_1 ?to)
    )
  )
)