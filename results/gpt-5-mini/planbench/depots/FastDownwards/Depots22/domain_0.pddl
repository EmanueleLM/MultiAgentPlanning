(define (domain truck-hoist-warehouse)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck crate hoist)

  ;; Predicates
  (:predicates
    ;; locations and containment
    (at-truck ?tr - truck ?p - place)         ; truck ?tr is at place ?p (unique per truck)
    (at-crate ?c - crate ?p - place)          ; crate ?c is on the ground/surface at place ?p
    (in ?c - crate ?tr - truck)               ; crate ?c is inside truck ?tr

    ;; hoist state and positioning
    (hoist-at ?h - hoist ?p - place)          ; hoist ?h is positioned at place ?p
    (hoist-empty ?h - hoist)                  ; hoist ?h currently holds nothing
    (hoist-holding ?h - hoist ?c - crate)     ; hoist ?h is holding crate ?c
    (attached ?h - hoist ?c - crate)          ; hoist ?h is attached to crate ?c (hook/clamp)
    (lifted-clear ?c - crate)                 ; crate ?c has been lifted to clearance height

    ;; truck access and dock state
    (truck-docked ?tr - truck ?p - place)     ; truck ?tr is docked at place ?p (secured/levelled)
    (truck-door-open ?tr - truck)             ; truck ?tr cargo door is open

    ;; access/safety
    (area-clear ?p - place)                   ; place ?p is clear for docking/hoist access
    (hoist-aligned ?h - hoist ?c - crate ?p - place) ; hoist ?h is horizontally aligned with crate ?c at place ?p
  )

  ;; ACTIONS
  ;; Truck movement: drive-truck
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (not (truck-docked ?tr ?from))        ; must undock before driving
      (not (truck-door-open ?tr))            ; doors must be closed before driving
      (not (at-truck ?tr ?to))               ; prevent no-op moves (sanity)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Docking and door operations
  (:action dock-truck
    :parameters (?tr - truck ?p - place)
    :precondition (and
      (at-truck ?tr ?p)
      (area-clear ?p)
    )
    :effect (and
      (truck-docked ?tr ?p)
    )
  )

  (:action undock-truck
    :parameters (?tr - truck ?p - place)
    :precondition (and
      (truck-docked ?tr ?p)
      (at-truck ?tr ?p)
    )
    :effect (and
      (not (truck-docked ?tr ?p))
    )
  )

  (:action open-truck-door
    :parameters (?tr - truck ?p - place)
    :precondition (and
      (truck-docked ?tr ?p)
      (at-truck ?tr ?p)
    )
    :effect (and
      (truck-door-open ?tr)
    )
  )

  (:action close-truck-door
    :parameters (?tr - truck)
    :precondition (truck-door-open ?tr)
    :effect (and
      (not (truck-door-open ?tr))
    )
  )

  ;; HOIST: attach a crate (from ground) to the hoist
  (:action hoist-attach
    :parameters (?h - hoist ?c - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at-crate ?c ?p)
      (hoist-empty ?h)
      (area-clear ?p)
      (hoist-aligned ?h ?c ?p)
    )
    :effect (and
      (attached ?h ?c)
      (hoist-holding ?h ?c)
      (not (at-crate ?c ?p))
      (not (hoist-empty ?h))
    )
  )

  ;; HOIST: lift attached crate to clearance
  (:action hoist-lift-to-clearance
    :parameters (?h - hoist ?c - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (attached ?h ?c)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (lifted-clear ?c)
    )
  )

  ;; HOIST: move while empty
  (:action hoist-move-empty
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-empty ?h)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  ;; HOIST: move while holding a crate (requires crate lifted above obstructions)
  (:action hoist-move-loaded
    :parameters (?h - hoist ?c - crate ?from - place ?to - place)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-holding ?h ?c)
      (lifted-clear ?c)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  ;; HOIST: lower and detach crate to ground at current hoist location
  (:action hoist-lower-to-ground
    :parameters (?h - hoist ?c - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (at-crate ?c ?p)
      (not (hoist-holding ?h ?c))
      (not (attached ?h ?c))
      (hoist-empty ?h)
      (not (lifted-clear ?c))
    )
  )

  ;; HOIST: load crate into truck (lower into truck cargo area). Requires truck docked and door open.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-holding ?h ?c)
      (at-truck ?tr ?p)
      (truck-docked ?tr ?p)
      (truck-door-open ?tr)
      (lifted-clear ?c)    ; crate must be lifted to clearance before horizontal placement into truck
    )
    :effect (and
      (in ?c ?tr)
      (not (hoist-holding ?h ?c))
      (not (attached ?h ?c))
      (hoist-empty ?h)
      (not (lifted-clear ?c))
    )
  )

  ;; HOIST: attach to crate that is inside a truck (for unloading)
  (:action hoist-attach-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (at-truck ?tr ?p)
      (in ?c ?tr)
      (hoist-empty ?h)
      (truck-docked ?tr ?p)
      (truck-door-open ?tr)
    )
    :effect (and
      (attached ?h ?c)
      (hoist-holding ?h ?c)
      (not (in ?c ?tr))
      (not (hoist-empty ?h))
    )
  )

  ;; HOIST: unload from truck then lower to ground at hoist location (combined lower & detach)
  (:action hoist-lower-from-truck-to-ground
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-holding ?h ?c)
      (at-truck ?tr ?p)
      (truck-docked ?tr ?p)
      (truck-door-open ?tr)
    )
    :effect (and
      (at-crate ?c ?p)
      (not (hoist-holding ?h ?c))
      (not (attached ?h ?c))
      (hoist-empty ?h)
      (not (lifted-clear ?c))
    )
  )

)