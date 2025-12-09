(define (domain crate-hoist-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck crate pallet hoist surface)

  (:predicates
    ;; Locations
    (at-truck ?tr - truck ?p - place)
    (hoist-at ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; occupancy / stacking
    (on ?c - crate ?s - surface)        ;; crate c is on surface s (surface can be pallet or crate)
    (in-truck ?c - crate ?tr - truck)  ;; crate c is loaded in truck tr

    ;; hoist state and surface clearance
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
    (clear ?s - surface)               ;; surface s (pallet or crate) has nothing on it
  )

  ;; -------------------------
  ;; Driver actions (prefixed)
  ;; -------------------------

  ;; driver drives truck0 from depot1 to depot0
  ;; Operational precondition: crate0 must already be in truck0 before this drive.
  (:action driver-drive-truck0-depot1-depot0
    :precondition (and
      (at-truck truck0 depot1)
      (in-truck crate0 truck0)
    )
    :effect (and
      (not (at-truck truck0 depot1))
      (at-truck truck0 depot0)
    )
  )

  ;; driver drives truck1 from depot1 to depot0
  ;; Operational precondition: crate1 must already be in truck1 before this drive.
  (:action driver-drive-truck1-depot1-depot0
    :precondition (and
      (at-truck truck1 depot1)
      (in-truck crate1 truck1)
    )
    :effect (and
      (not (at-truck truck1 depot1))
      (at-truck truck1 depot0)
    )
  )

  ;; -------------------------
  ;; HoistA actions at depot1
  ;; -------------------------

  ;; hoistA lifts crate0 from its surface at depot1
  (:action hoistA-lift-crate0
    :precondition (and
      (hoist-at hoistA depot1)
      (hoist-available hoistA)
      (on crate0 surface0_depot1)
      (surface-at surface0_depot1 depot1)
      (clear crate0)
    )
    :effect (and
      (not (on crate0 surface0_depot1))
      (not (surface-at crate0 depot1))
      (hoist-lifting hoistA crate0)
      (not (hoist-available hoistA))
      (clear surface0_depot1)
    )
  )

  ;; hoistA loads crate0 into truck0 at depot1
  (:action hoistA-load-crate0-into-truck0
    :precondition (and
      (hoist-at hoistA depot1)
      (at-truck truck0 depot1)
      (hoist-lifting hoistA crate0)
    )
    :effect (and
      (in-truck crate0 truck0)
      (not (hoist-lifting hoistA crate0))
      (hoist-available hoistA)
    )
  )

  ;; hoistA lifts crate1 from its surface at depot1
  (:action hoistA-lift-crate1
    :precondition (and
      (hoist-at hoistA depot1)
      (hoist-available hoistA)
      (on crate1 surface1_depot1)
      (surface-at surface1_depot1 depot1)
      (clear crate1)
    )
    :effect (and
      (not (on crate1 surface1_depot1))
      (not (surface-at crate1 depot1))
      (hoist-lifting hoistA crate1)
      (not (hoist-available hoistA))
      (clear surface1_depot1)
    )
  )

  ;; hoistA loads crate1 into truck1 at depot1
  (:action hoistA-load-crate1-into-truck1
    :precondition (and
      (hoist-at hoistA depot1)
      (at-truck truck1 depot1)
      (hoist-lifting hoistA crate1)
    )
    :effect (and
      (in-truck crate1 truck1)
      (not (hoist-lifting hoistA crate1))
      (hoist-available hoistA)
    )
  )

  ;; -------------------------
  ;; HoistB actions at depot0
  ;; -------------------------

  ;; hoistB unloads crate0 from truck0 at depot0 (prepare for drop)
  (:action hoistB-unload-crate0-from-truck0
    :precondition (and
      (hoist-at hoistB depot0)
      (hoist-available hoistB)
      (in-truck crate0 truck0)
      (at-truck truck0 depot0)
    )
    :effect (and
      (not (in-truck crate0 truck0))
      (not (hoist-available hoistB))
      (hoist-lifting hoistB crate0)
    )
  )

  ;; hoistB drops crate0 onto crate2 at depot0
  (:action hoistB-drop-crate0-onto-crate2
    :precondition (and
      (hoist-at hoistB depot0)
      (surface-at crate2 depot0)
      (clear crate2)
      (hoist-lifting hoistB crate0)
    )
    :effect (and
      (hoist-available hoistB)
      (not (hoist-lifting hoistB crate0))
      (on crate0 crate2)
      (clear crate0)
      (not (clear crate2))
      (surface-at crate0 depot0)
    )
  )

  ;; hoistB unloads crate1 from truck1 at depot0 (prepare for drop)
  (:action hoistB-unload-crate1-from-truck1
    :precondition (and
      (hoist-at hoistB depot0)
      (hoist-available hoistB)
      (in-truck crate1 truck1)
      (at-truck truck1 depot0)
    )
    :effect (and
      (not (in-truck crate1 truck1))
      (not (hoist-available hoistB))
      (hoist-lifting hoistB crate1)
    )
  )

  ;; hoistB drops crate1 onto crate0 at depot0
  ;; IMPORTANT explicit ordering: requires crate0 already on crate2 and crate0 clear.
  (:action hoistB-drop-crate1-onto-crate0
    :precondition (and
      (hoist-at hoistB depot0)
      (on crate0 crate2)
      (surface-at crate0 depot0)
      (clear crate0)
      (hoist-lifting hoistB crate1)
    )
    :effect (and
      (hoist-available hoistB)
      (not (hoist-lifting hoistB crate1))
      (on crate1 crate0)
      (not (clear crate0))
      (clear crate1)
      (surface-at crate1 depot0)
    )
  )
)