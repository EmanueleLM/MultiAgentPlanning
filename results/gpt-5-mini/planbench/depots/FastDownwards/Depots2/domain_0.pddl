(define (domain depot-operations)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    driver hoistop depot-manager auditor truck hoist crate pallet location
  )

  (:predicates
    ; locations
    (at-driver ?d - driver ?l - location)
    (at-depotmanager ?m - depot-manager ?l - location)
    (at-auditor ?a - auditor ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-hoist ?h - hoist ?l - location)
    (at-crate ?c - crate ?l - location)

    ; possession / transport
    (crate-on-truck ?c - crate ?t - truck)

    ; pallet state
    (pallet-at ?p - pallet ?l - location)
    (pallet-reserved ?p - pallet)
    (pallet-occupied ?p - pallet)

    ; final placement
    (on-pallet ?c - crate ?p - pallet)

    ; audit state
    (audited ?c - crate)
  )

  ;; DRIVER actions (namespaced driver-)
  (:action driver-move
    :parameters (?drv - driver ?t - truck ?from - location ?to - location)
    :precondition (and (at-driver ?drv ?from) (at-truck ?t ?from))
    :effect (and
      (not (at-driver ?drv ?from)) (at-driver ?drv ?to)
      (not (at-truck ?t ?from)) (at-truck ?t ?to)
    )
  )

  (:action driver-load-truck
    :parameters (?drv - driver ?t - truck ?c - crate ?l - location)
    :precondition (and (at-driver ?drv ?l) (at-truck ?t ?l) (at-crate ?c ?l))
    :effect (and
      (crate-on-truck ?c ?t)
      (not (at-crate ?c ?l))
    )
  )

  (:action driver-unload-truck
    :parameters (?drv - driver ?t - truck ?c - crate ?l - location)
    :precondition (and (at-driver ?drv ?l) (at-truck ?t ?l) (crate-on-truck ?c ?t))
    :effect (and
      (not (crate-on-truck ?c ?t))
      (at-crate ?c ?l)
    )
  )

  ;; HOIST OPERATOR actions (namespaced hoistop-)
  (:action hoistop-move
    :parameters (?hop - hoistop ?h - hoist ?from - location ?to - location)
    :precondition (at-hoist ?h ?from)
    :effect (and
      (not (at-hoist ?h ?from)) (at-hoist ?h ?to)
    )
  )

  (:action hoistop-place-on-pallet
    :parameters (?hop - hoistop ?h - hoist ?c - crate ?p - pallet ?l - location)
    :precondition (and
      (at-hoist ?h ?l)
      (pallet-at ?p ?l)
      (at-crate ?c ?l)
      (not (pallet-occupied ?p))
      (pallet-reserved ?p)
      (audited ?c)
    )
    :effect (and
      (on-pallet ?c ?p)
      (pallet-occupied ?p)
      (not (at-crate ?c ?l))
    )
  )

  ;; DEPOT MANAGER actions (namespaced depot-)
  (:action depot-reserve-pallet
    :parameters (?dm - depot-manager ?p - pallet ?l - location)
    :precondition (and (at-depotmanager ?dm ?l) (pallet-at ?p ?l) (not (pallet-reserved ?p)) (not (pallet-occupied ?p)))
    :effect (pallet-reserved ?p)
  )

  (:action depot-move
    :parameters (?dm - depot-manager ?from - location ?to - location)
    :precondition (at-depotmanager ?dm ?from)
    :effect (and (not (at-depotmanager ?dm ?from)) (at-depotmanager ?dm ?to))
  )

  ;; AUDITOR actions (namespaced auditor-)
  (:action auditor-move
    :parameters (?aud - auditor ?from - location ?to - location)
    :precondition (at-auditor ?aud ?from)
    :effect (and (not (at-auditor ?aud ?from)) (at-auditor ?aud ?to))
  )

  (:action auditor-inspect-crate
    :parameters (?aud - auditor ?c - crate ?l - location)
    :precondition (and (at-auditor ?aud ?l) (at-crate ?c ?l))
    :effect (audited ?c)
  )
)