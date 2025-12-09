; Domain: hoist-truck-pallet
; Assumptions (see also separate assumptions note after the problem):
; - Single shared location "dock" where the truck, the hoist, and all pallets are colocated.
; - All crates start inside the single truck (truck0). Pallets are empty at start.
; - Each pallet may hold at most one crate (enforced by pallet-free predicate).
(define (domain hoist-truck-pallet)
  :requirements :strips :typing :negative-preconditions
  :types hoist truck crate pallet location

  :predicates
    ; agent/location predicates
    (at-hoist ?h - hoist ?loc - location)
    (at-truck ?t - truck ?loc - location)

    ; crate location predicates
    (in-truck ?c - crate ?t - truck)
    (crate-on-pallet ?c - crate ?p - pallet)

    ; supporting predicates for action preconditions (bookkeeping as explicit state)
    (holding ?h - hoist ?c - crate)
    (hoist-empty ?h - hoist)
    (pallet-at ?p - pallet ?loc - location)
    (pallet-free ?p - pallet)
  ; Actions used by the hoist to move crates between truck and pallets.
  ; Hoist actions are distinct from truck actions to preserve intended separation of agents.

  ; Pick a crate from a truck bed using the hoist
  (action hoist-pick-from-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?loc - location)
    :precondition (and
      (at-hoist ?h ?loc)
      (at-truck ?t ?loc)
      (in-truck ?c ?t)
      (hoist-empty ?h)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (not (hoist-empty ?h))
      (holding ?h ?c)
    )
  )

  ; Place a crate from hoist onto a pallet
  (action hoist-place-on-pallet
    :parameters (?h - hoist ?p - pallet ?c - crate ?loc - location)
    :precondition (and
      (at-hoist ?h ?loc)
      (pallet-at ?p ?loc)
      (holding ?h ?c)
      (pallet-free ?p)
    )
    :effect (and
      (not (holding ?h ?c))
      (hoist-empty ?h)
      (crate-on-pallet ?c ?p)
      (not (pallet-free ?p))
    )
  )

  ; Pick a crate from a pallet using the hoist (allows relocating crates)
  (action hoist-pick-from-pallet
    :parameters (?h - hoist ?p - pallet ?c - crate ?loc - location)
    :precondition (and
      (at-hoist ?h ?loc)
      (pallet-at ?p ?loc)
      (crate-on-pallet ?c ?p)
      (hoist-empty ?h)
    )
    :effect (and
      (not (crate-on-pallet ?c ?p))
      (not (hoist-empty ?h))
      (holding ?h ?c)
      (pallet-free ?p)
    )
  )

  ; Optional truck movement and load/unload actions are intentionally omitted
  ; because this problem's initial state assumes co-location at a single dock.
)