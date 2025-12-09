(define (domain logistics_multiagent)
  (:requirements :strips :typing)
  (:types vehicle package location city truck plane - vehicle)

  (:predicates
    ; vehicle location predicates
    (at ?v - vehicle ?l - location)            ; vehicle ?v is at location ?l
    ; package location / containment predicates
    (at-pkg ?p - package ?l - location)        ; package ?p is at location ?l
    (in ?p - package ?v - vehicle)             ; package ?p is in vehicle ?v
    ; topology / classification
    (is-airport ?l - location)                 ; location ?l is an airport
    (in-city ?l - location ?c - city)          ; location ?l belongs to city ?c
  )

  ; =========================
  ; Truck actions (prefix truck_)
  ; =========================
  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at-pkg ?p ?l)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?t)
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at-pkg ?p ?l)
    )
  )

  ; =========================
  ; Airplane actions (prefix plane_)
  ; =========================
  (:action plane_fly
    :parameters (?pl - plane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
      (at ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )

  (:action plane_load
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at ?pl ?l)
      (is-airport ?l)
      (at-pkg ?p ?l)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?pl)
    )
  )

  (:action plane_unload
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at ?pl ?l)
      (is-airport ?l)
      (in ?p ?pl)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-pkg ?p ?l)
    )
  )

)