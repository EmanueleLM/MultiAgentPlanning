(define (domain port-transfer)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent driver hoist-operator lift-operator truck container location phase)

  ;; Predicates
  (:predicates
    ;; locations
    (at-agent ?a - agent ?l - location)
    (at-truck ?t - truck ?l - location)
    (container-at ?c - container ?l - location)
    (in-truck ?c - container ?t - truck)
    ;; operator holding state
    (holding ?op - agent ?c - container)
    (operator-free ?op - agent)
    ;; truck capacity indicator (simple boolean: empty or not)
    (truck-empty ?t - truck)
    ;; phase control to enforce sequence
    (current-phase ?p - phase)
  )

  ;; ACTIONS
  ;; 1) hoist: hoist-operator picks a container from a location (phase1)
  (:action hoist
    :parameters (?hop - hoist-operator ?c - container ?loc - location)
    :precondition (and
      (current-phase phase1_load)
      (at-agent ?hop ?loc)
      (container-at ?c ?loc)
      (operator-free ?hop)
    )
    :effect (and
      (not (container-at ?c ?loc))
      (holding ?hop ?c)
      (not (operator-free ?hop))
    )
  )

  ;; 2) load: hoist-operator loads held container into a co-located truck (ends phase1, begins phase2)
  (:action load
    :parameters (?hop - hoist-operator ?t - truck ?c - container ?loc - location)
    :precondition (and
      (current-phase phase1_load)
      (at-agent ?hop ?loc)
      (at-truck ?t ?loc)
      (holding ?hop ?c)
      (truck-empty ?t)
    )
    :effect (and
      ;; place container into truck and free operator; truck now non-empty
      (in-truck ?c ?t)
      (not (holding ?hop ?c))
      (operator-free ?hop)
      (not (truck-empty ?t))
      ;; advance phase: phase1 -> phase2
      (not (current-phase phase1_load))
      (current-phase phase2_drive)
    )
  )

  ;; 3) drive: driver moves the truck (and driver) from one location to another (ends phase2, begins phase3)
  (:action drive
    :parameters (?drv - driver ?t - truck ?from - location ?to - location)
    :precondition (and
      (current-phase phase2_drive)
      (at-agent ?drv ?from)
      (at-truck ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      ;; move driver and truck
      (not (at-agent ?drv ?from))
      (at-agent ?drv ?to)
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      ;; advance phase: phase2 -> phase3
      (not (current-phase phase2_drive))
      (current-phase phase3_lift)
    )
  )

  ;; 4) lift: lift-operator picks container out of a co-located truck (requires phase3)
  (:action lift
    :parameters (?lft - lift-operator ?t - truck ?c - container ?loc - location)
    :precondition (and
      (current-phase phase3_lift)
      (at-agent ?lft ?loc)
      (at-truck ?t ?loc)
      (in-truck ?c ?t)
      (operator-free ?lft)
    )
    :effect (and
      ;; remove container from truck, mark operator holding, mark truck empty
      (not (in-truck ?c ?t))
      (holding ?lft ?c)
      (not (operator-free ?lft))
      (truck-empty ?t)
    )
  )

  ;; 5) drop: lift-operator drops a held container at the current location (ends phase3, begins final)
  (:action drop
    :parameters (?lft - lift-operator ?c - container ?loc - location)
    :precondition (and
      (current-phase phase3_lift)
      (at-agent ?lft ?loc)
      (holding ?lft ?c)
    )
    :effect (and
      (not (holding ?lft ?c))
      (operator-free ?lft)
      (container-at ?c ?loc)
      ;; advance phase: phase3 -> complete
      (not (current-phase phase3_lift))
      (current-phase phase4_complete)
    )
  )

  ;; 6) unload: hoist-operator unloads a container from a co-located truck onto the ground.
  ;;    This action is intentionally constrained so it cannot be used to bypass the required sequence.
  (:action unload
    :parameters (?hop - hoist-operator ?t - truck ?c - container ?loc - location)
    :precondition (and
      ;; Only allowed before drive begins if still in load phase (symmetric counterpart to load)
      (current-phase phase1_load)
      (at-agent ?hop ?loc)
      (at-truck ?t ?loc)
      (in-truck ?c ?t)
      (operator-free ?hop)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (container-at ?c ?loc)
      (operator-free ?hop) ; remains free (operator did not take it into hand)
      (truck-empty ?t)
      ;; remain in phase1 (this is a no-phase-advance variant that returns container to ground)
    )
  )
)