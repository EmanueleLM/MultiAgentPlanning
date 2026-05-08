(define (domain multiagent-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    truck
    hoist
  )

  (:predicates
    ;; type membership unary predicates (reflect public classification)
    (is_place ?p - place)
    (is_depot ?d - depot)
    (is_distributor ?di - distributor)
    (is_pallet ?pl - pallet)
    (is_crate ?c - crate)
    (is_truck ?t - truck)
    (is_hoist ?h - hoist)

    ;; static connectivity (publicly stated)
    (road-connected ?p1 - place ?p2 - place)

    ;; explicit location/state predicates
    (at-truck ?t - truck ?p - place)        ; truck at place
    (at-hoist ?h - hoist ?p - place)        ; hoist at place (hoists do not move)
    (at-pallet ?pl - pallet ?p - place)     ; pallet located at place (pallets are fixed to places)
    (at ?c - crate ?p - place)              ; crate is resting at place (not in truck and not held)
    (at-surface ?s - surface ?p - place)    ; any surface (pallet or crate) is at place

    ;; stacking / support relations
    (on ?c - crate ?s - surface)            ; crate c is directly on surface s

    ;; top-of-surface predicate (ensures single direct occupant)
    (clear ?s - surface)

    ;; hoist possession state (mutually exclusive invariants enforced by preconditions/effects)
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; crate inside truck
    (in-truck ?c - crate ?tr - truck)
  )

  ;; Actions are namespaced by capability/agent role:
  ;; - truck-drive: trucks move between places
  ;; - hoist-lift / hoist-drop / hoist-load / hoist-unload: hoist operations

  ;; DRIVE: move a truck from one place to another
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      ;; Frame note: in-truck facts are intentionally untouched here: crates inside
      ;; a truck remain in-truck and therefore implicitly travel with the truck.
    )
  )

  ;; HOIST LIFT: hoist lifts a clear top crate from a surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at ?c ?p)                   ;; crate must be physically at the place (not in-truck, not held)
      (at-surface ?s ?p)           ;; the supporting surface must be at the same place
      (on ?c ?s)                   ;; crate is directly on that surface
      (hoist-free ?h)              ;; hoist must be available
      (clear ?c)                   ;; crate must have nothing on top of it
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))

      ;; crate is removed from the surface and from the place while held
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (at-surface ?c ?p))

      ;; surface becomes clear once the top object is removed
      (clear ?s)

      ;; crate remains clear while held; explicitly assert (no-op if already true)
      (clear ?c)
    )
  )

  ;; HOIST DROP: hoist drops the crate it holds onto a clear surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-holding ?h ?c)
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      ;; hoist becomes available and no longer holds the crate
      (not (hoist-holding ?h ?c))
      (hoist-free ?h)

      ;; crate is placed onto the surface and becomes located at the place
      (on ?c ?s)
      (at ?c ?p)
      (at-surface ?c ?p)

      ;; support surface is no longer clear (occupied)
      (not (clear ?s))

      ;; the crate dropped is topmost, hence clear
      (clear ?c)
    )
  )

  ;; HOIST LOAD: hoist loads the crate it holds into a co-located truck
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-holding ?h ?c)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
    )
    :effect (and
      ;; crate is now inside the truck (no longer at place or on any surface)
      (in-truck ?c ?tr)

      ;; hoist becomes free and stops holding the crate
      (not (hoist-holding ?h ?c))
      (hoist-free ?h)

      ;; ensure crate is not considered at a place/surface while in truck
      (not (at ?c ?p))
      (not (at-surface ?c ?p))
      (not (on ?c ?_))   ;; syntactic placeholder to indicate crate has no on(...) relation;
                        ;; planners that do not accept such a generic deletion will still
                        ;; be correct because on(...) was deleted at lift time.
    )
  )

  ;; HOIST UNLOAD: hoist takes a crate out of a co-located truck (hoist must be free)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck, hoist holds crate, hoist becomes unavailable
      (not (in-truck ?c ?tr))
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))

      ;; crate is no longer considered at-place or on-surface until dropped
      (not (at ?c ?p))
      (not (at-surface ?c ?p))
      (not (on ?c ?_))
    )
  )

)