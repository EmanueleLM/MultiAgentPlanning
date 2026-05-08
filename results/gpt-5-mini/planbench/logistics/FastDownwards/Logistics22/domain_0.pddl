(define (domain multiagent_transport)
  (:requirements :strips :typing)
  (:types truck plane vehicle package location)

  (:predicates
    ;; vehicle location predicates
    (at ?v - vehicle ?l - location)
    ;; package location when on the ground
    (at-pkg ?p - package ?l - location)
    ;; package inside a vehicle
    (in ?p - package ?v - vehicle)
    ;; connectivity predicates (explicitly provided in problem)
    (road-connect ?l1 - location ?l2 - location)
    (air-connect ?l1 - location ?l2 - location)
    ;; vehicle capacity flag: true when vehicle is free to accept a package
    (free ?v - vehicle)
  )

  ;; === Truck agent actions (namespaced with truck-) ===
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at-pkg ?p ?l)
      (free ?t)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?t)
      (not (free ?t))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at-pkg ?p ?l)
      (free ?t)
    )
  )

  (:action truck-move
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at ?t ?from)
      (road-connect ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; === Plane agent actions (namespaced with plane-) ===
  (:action plane-load
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at ?pl ?l)
      (at-pkg ?p ?l)
      (free ?pl)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?pl)
      (not (free ?pl))
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at ?pl ?l)
      (in ?p ?pl)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-pkg ?p ?l)
      (free ?pl)
    )
  )

  (:action plane-move
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and
      (at ?pl ?from)
      (air-connect ?from ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )

)