(define (domain multiagent-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types item location day)

  (:predicates
    (at ?i - item ?l - location)
    (packed-on ?i - item ?d - day)
    (shipped-on ?i - item ?d - day)
    (inspected-on ?i - item ?d - day)
    (day-successor ?d1 - day ?d2 - day)
    (available-day ?d - day)
    (unpacked ?i - item)
    (unshipped ?i - item)
    (uninspected ?i - item)
  )

  ; Action performed by the packing agent: must pack an unpacked item on a specific day.
  (:action packer-pack
    :parameters (?i - item ?loc - location ?d - day)
    :precondition (and
      (at ?i ?loc)
      (available-day ?d)
      (unpacked ?i)
    )
    :effect (and
      (not (unpacked ?i))
      (packed-on ?i ?d)
    )
  )

  ; Action performed by the shipping agent: requires packing occurred on immediate predecessor day.
  (:action shipper-ship
    :parameters (?i - item ?from - location ?to - location ?dprev - day ?d - day)
    :precondition (and
      (packed-on ?i ?dprev)
      (day-successor ?dprev ?d)
      (at ?i ?from)
      (available-day ?d)
      (unshipped ?i)
    )
    :effect (and
      (not (unshipped ?i))
      (shipped-on ?i ?d)
      (not (at ?i ?from))
      (at ?i ?to)
    )
  )

  ; Action performed by the inspection agent: requires shipping occurred on immediate predecessor day.
  (:action inspector-inspect
    :parameters (?i - item ?dprev - day ?d - day)
    :precondition (and
      (shipped-on ?i ?dprev)
      (day-successor ?dprev ?d)
      (available-day ?d)
      (uninspected ?i)
    )
    :effect (and
      (not (uninspected ?i))
      (inspected-on ?i ?d)
    )
  )
)