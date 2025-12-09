(define (domain multiagent-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck hoist container location)

  (:predicates
    (truck-at ?tr - truck ?l - location)
    (hoist-at ?h - hoist ?l - location)
    (container-at ?c - container ?l - location)
    (container-on-truck ?c - container ?tr - truck)
    (container-on-hoist ?c - container ?h - hoist)
    (hoist-engaged ?h - hoist)
    (hoist-safety-checked ?h - hoist)
    (container-secured ?c - container ?tr - truck)
    (truck-locked ?tr - truck)
  )

  ;; Hoist operator actions (prefixed with hoist-)

  (:action hoist-safety-check
    :parameters (?h - hoist ?l - location)
    :precondition (and
      (hoist-at ?h ?l)
      (not (hoist-engaged ?h))
    )
    :effect (and
      (hoist-safety-checked ?h)
    )
  )

  (:action hoist-attach-to-ground
    :parameters (?h - hoist ?c - container ?tr - truck ?l - location)
    :precondition (and
      (hoist-at ?h ?l)
      (container-at ?c ?l)
      (hoist-safety-checked ?h)
      (not (container-on-hoist ?c ?h))
      (not (container-on-truck ?c ?tr))
    )
    :effect (and
      (container-on-hoist ?c ?h)
      (not (container-at ?c ?l))
    )
  )

  (:action hoist-engage
    :parameters (?h - hoist ?c - container)
    :precondition (and
      (container-on-hoist ?c ?h)
      (hoist-safety-checked ?h)
      (not (hoist-engaged ?h))
    )
    :effect (and
      (hoist-engaged ?h)
    )
  )

  (:action hoist-disengage
    :parameters (?h - hoist ?c - container)
    :precondition (and
      (hoist-engaged ?h)
      (not (container-on-hoist ?c ?h)) ; must not be holding a container to disengage
    )
    :effect (and
      (not (hoist-engaged ?h))
    )
  )

  (:action hoist-move-with-load
    :parameters (?h - hoist ?from - location ?to - location ?c - container)
    :precondition (and
      (hoist-at ?h ?from)
      (container-on-hoist ?c ?h)
      (hoist-engaged ?h)
      (not (= ?from ?to))
    )
    :effect (and
      (hoist-at ?h ?to)
      (container-at ?c ?to)
      (not (hoist-at ?h ?from))
      (not (container-at ?c ?from))
    )
  )

  (:action hoist-place-on-truck
    :parameters (?h - hoist ?c - container ?tr - truck ?l - location)
    :precondition (and
      (hoist-at ?h ?l)
      (container-on-hoist ?c ?h)
      (truck-at ?tr ?l)
    )
    :effect (and
      (container-on-truck ?c ?tr)
      (not (container-on-hoist ?c ?h))
      ;; container-at remains true when hoist moved it here by hoist-move-with-load
    )
  )

  (:action hoist-attach-from-truck
    :parameters (?h - hoist ?c - container ?tr - truck ?l - location)
    :precondition (and
      (hoist-at ?h ?l)
      (truck-at ?tr ?l)
      (container-on-truck ?c ?tr)
      (hoist-safety-checked ?h)
      (not (hoist-engaged ?h))
      (not (container-on-hoist ?c ?h))
    )
    :effect (and
      (container-on-hoist ?c ?h)
      (not (container-on-truck ?c ?tr))
    )
  )

  (:action hoist-place-on-ground
    :parameters (?h - hoist ?c - container ?l - location)
    :precondition (and
      (hoist-at ?h ?l)
      (container-on-hoist ?c ?h)
    )
    :effect (and
      (container-at ?c ?l)
      (not (container-on-hoist ?c ?h))
    )
  )

  ;; Truck operator actions (prefixed with truck-)

  (:action truck-secure-load
    :parameters (?tr - truck ?c - container ?l - location)
    :precondition (and
      (truck-at ?tr ?l)
      (container-on-truck ?c ?tr)
      (not (container-secured ?c ?tr))
      (not (hoist-engaged ?h)) ;; safety: hoist must not be engaged anywhere while securing
    )
    :effect (and
      (container-secured ?c ?tr)
    )
  )

  (:action truck-lock
    :parameters (?tr - truck ?c - container ?l - location)
    :precondition (and
      (truck-at ?tr ?l)
      (container-secured ?c ?tr)
      (not (truck-locked ?tr))
    )
    :effect (and
      (truck-locked ?tr)
    )
  )

  (:action truck-unlock
    :parameters (?tr - truck ?l - location)
    :precondition (and
      (truck-at ?tr ?l)
      (truck-locked ?tr)
    )
    :effect (and
      (not (truck-locked ?tr))
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - container ?h - hoist)
    :precondition (and
      (truck-at ?tr ?from)
      (truck-locked ?tr)
      ;; safety: no hoist may be engaged anywhere when truck drives
      (not (hoist-engaged ?h))
      ;; ensure the container is secured to the truck to allow transport
      (container-secured ?c ?tr)
    )
    :effect (and
      (truck-at ?tr ?to)
      (not (truck-at ?tr ?from))
      ;; container moves with the truck when secured and on the truck
      (when (container-on-truck ?c ?tr)
        (and (container-at ?c ?to) (not (container-at ?c ?from))))
    )
  )

  ;; The :when effect above is not supported in pure :strips -
  ;; to remain within :strips we encode the driving effect for the single-container case
  ;; by also providing an explicit driving action specialized to move the container when it's on the truck.
  ;; (This duplication ensures compatibility with planners that only support basic STRIPS.)
  
  (:action truck-drive-with-load
    :parameters (?tr - truck ?from - location ?to - location ?c - container ?h - hoist)
    :precondition (and
      (truck-at ?tr ?from)
      (truck-locked ?tr)
      (container-secured ?c ?tr)
      (container-on-truck ?c ?tr)
      (not (hoist-engaged ?h))
    )
    :effect (and
      (truck-at ?tr ?to)
      (not (truck-at ?tr ?from))
      (container-at ?c ?to)
      (not (container-at ?c ?from))
    )
  )

)