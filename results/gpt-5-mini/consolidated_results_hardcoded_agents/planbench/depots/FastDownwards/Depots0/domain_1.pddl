(define (domain depots-ordered-stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist pallet crate stage
  )

  (:predicates
    ;; location predicate for trucks, hoists, pallets, crates (all indexed by place)
    (at ?obj - (either truck hoist pallet crate) ?pl - place)

    ;; crate inside truck
    (in ?c - crate ?v - truck)

    ;; crate on a surface (pallet or another crate)
    (on ?c - crate ?s - (either pallet crate))

    ;; surface (pallet or crate) is clear (nothing on top)
    (clear ?s - (either pallet crate))

    ;; hoist free (available) or hoist lifting a specific crate
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; explicit ordered stages and current-stage token
    (now ?st - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; DRIVE: move truck from one place to another, advancing the stage token
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at ?tr ?from)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST LIFT: lift a crate from a surface (pallet or crate) at a place
  ;; Preconditions follow the specification: hoist at same place as crate and surface, hoist free, crate clear, crate on that surface.
  ;; Effects: crate no longer at the place, hoist lifts crate, hoist not free, surface becomes clear, crate not on the surface, advance stage.
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?surf - (either pallet crate) ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at ?h ?pl)
      (at ?surf ?pl)
      (at ?c ?pl)
      (hoist-free ?h)
      (clear ?c)
      (on ?c ?surf)
    )
    :effect (and
      (not (at ?c ?pl))
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (clear ?surf)
      (not (on ?c ?surf))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST DROP: drop a crate from hoist to a surface at the same place (surface must be clear)
  ;; Effects: hoist becomes free, hoist not lifting crate, crate at place, surface not clear, crate clear, crate on surface, advance stage.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?surf - (either pallet crate) ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at ?h ?pl)
      (at ?surf ?pl)
      (clear ?surf)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-free ?h)
      (not (hoist-lifting ?h ?c))
      (at ?c ?pl)
      (not (clear ?surf))
      (clear ?c)
      (on ?c ?surf)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST LOAD: load a lifted crate into a truck at the place
  ;; Preconditions: hoist and truck at same place, hoist is lifting the crate
  ;; Effects: crate becomes in the truck, crate no longer at the place, hoist becomes free and stops lifting, advance stage.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?v - truck ?c - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at ?h ?pl)
      (at ?v ?pl)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in ?c ?v)
      (not (at ?c ?pl))
      (hoist-free ?h)
      (not (hoist-lifting ?h ?c))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; HOIST UNLOAD: unload a crate from a truck; hoist must be at same place as truck and be free, crate must be in the truck
  ;; Effects: crate no longer in truck, hoist not free, hoist lifts the crate, advance stage.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?v - truck ?c - crate ?pl - place ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (next ?s ?s2)
      (at ?h ?pl)
      (at ?v ?pl)
      (hoist-free ?h)
      (in ?c ?v)
    )
    :effect (and
      (not (in ?c ?v))
      (not (hoist-free ?h))
      (hoist-lifting ?h ?c)
      (not (now ?s))
      (now ?s2)
    )
  )
)