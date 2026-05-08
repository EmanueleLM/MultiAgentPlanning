(define (domain multiagent-hoist-truck)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place depot distributor
    entity
    crate pallet truck hoist - entity
  )

  (:predicates
    ;; location predicates
    (at ?e - entity ?p - place)

    ;; connectivity
    (road ?p1 - place ?p2 - place)

    ;; surfaces and stacking
    (on ?c - crate ?s - entity)        ;; crate c is on surface s (pallet or crate)
    (clear ?s - entity)               ;; surface or crate has nothing on top

    ;; in-truck
    (in ?c - crate ?t - truck)

    ;; hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; truck resource lock (prevents starting drive while truck is explicitly not idle in other models)
    (truck-idle ?t - truck)

    ;; explicit assignment constraints to enforce the orchestrated transport sequencing
    (assigned ?c - crate ?t - truck ?from - place ?to - place)
  )

  ;; ----------------
  ;; Hoist actions (namespaced: hoist-*)
  ;; ----------------

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - place ?s - entity)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (holding ?h ?c)
      (not (available ?h))
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (holding ?h ?c)
      ;; truck must be idle to accept a load (prevents drive start before load completes)
      (truck-idle ?t)
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
      ;; crate is no longer at the place
      (not (at ?c ?p))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (holding ?h ?c)
      (not (available ?h))
      ;; truck remains at place; truck-idle unaffected here (unload is atomic and will be followed by drop)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (holding ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (holding ?h ?c))
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; ----------------
  ;; Truck actions (namespaced: truck-*)
  ;; ----------------

  ;; Drive while truck is empty / idle (no crate in)
  (:action truck-drive-empty
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (truck-idle ?t)
      (road ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; Drive while carrying crates: this action moves a truck that currently contains a specific crate.
  ;; It is constrained by an assignment predicate to enforce the orchestrated movement to a particular destination.
  (:action truck-drive-with-load
    :parameters (?t - truck ?from - place ?to - place ?c - crate)
    :precondition (and
      (at ?t ?from)
      (in ?c ?t)
      (road ?from ?to)
      (assigned ?c ?t ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
      ;; crate remains in truck during the drive
    )
  )

)