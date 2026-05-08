(define (domain two-agent-transfer)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item source slot pslot)

  ;; Predicates
  ;; at-source ?it ?s        - item is at source location s
  ;; item-in-slot ?it ?sl    - item occupies buffer slot sl
  ;; slot-available ?sl      - buffer slot sl is free (token)
  ;; holding ?ag ?it         - agent ag currently holds item it
  ;; free-gripper ?ag        - agent ag's gripper is free (token)
  ;; on-pallet ?it ?ps       - item it is placed on pallet-slot ps (final stacked state)
  ;; pallet-slot-available ?ps - pallet slot ps is free (token)
  (:predicates
    (at-source ?it - item ?s - source)
    (item-in-slot ?it - item ?sl - slot)
    (slot-available ?sl - slot)
    (holding ?ag - agent ?it - item)
    (free-gripper ?ag - agent)
    (on-pallet ?it - item ?ps - pslot)
    (pallet-slot-available ?ps - pslot)
  )

  ;; Picker actions (performed by agent "picker")
  ;;  - picker-pick: pick an item from a source into the picker gripper.
  ;;    Preconditions: item is at source, picker gripper free, no agent holds the item.
  ;;    Effects: item no longer at source; picker holds item; picker gripper becomes occupied.
  (:action picker-pick
    :parameters (?it - item ?src - source)
    :precondition (and
      (at-source ?it ?src)
      (free-gripper picker)
      (not (holding picker ?it))
      (not (holding stacker ?it))
    )
    :effect (and
      (not (at-source ?it ?src))
      (holding picker ?it)
      (not (free-gripper picker))
    )
  )

  ;;  - picker-place-into-slot: place an item from picker's gripper into a buffer slot.
  ;;    Preconditions: picker holds the item; slot is available.
  ;;    Effects: item occupies slot; slot token consumed; picker becomes free.
  (:action picker-place-into-slot
    :parameters (?it - item ?sl - slot)
    :precondition (and
      (holding picker ?it)
      (slot-available ?sl)
    )
    :effect (and
      (item-in-slot ?it ?sl)
      (not (slot-available ?sl))
      (not (holding picker ?it))
      (free-gripper picker)
    )
  )

  ;; Stacker actions (performed by agent "stacker")
  ;;  - stacker-pick-from-slot: pick an item from a buffer slot into the stacker's gripper.
  ;;    Preconditions: item occupies the slot; stacker gripper free.
  ;;    Effects: slot becomes available again; stacker holds the item; stacker gripper becomes occupied.
  (:action stacker-pick-from-slot
    :parameters (?it - item ?sl - slot)
    :precondition (and
      (item-in-slot ?it ?sl)
      (free-gripper stacker)
      (not (holding picker ?it)) ;; explicit mutual exclusion: picker does not hold the item
      (not (holding stacker ?it))
    )
    :effect (and
      (not (item-in-slot ?it ?sl))
      (slot-available ?sl)
      (holding stacker ?it)
      (not (free-gripper stacker))
    )
  )

  ;;  - stacker-stack-onto-pallet: place an item from stacker's gripper onto a pallet-slot.
  ;;    Preconditions: stacker holds item; pallet-slot is available.
  ;;    Effects: item is on pallet-slot; pallet slot token consumed; stacker gripper released.
  (:action stacker-stack-onto-pallet
    :parameters (?it - item ?ps - pslot)
    :precondition (and
      (holding stacker ?it)
      (pallet-slot-available ?ps)
    )
    :effect (and
      (on-pallet ?it ?ps)
      (not (pallet-slot-available ?ps))
      (not (holding stacker ?it))
      (free-gripper stacker)
    )
  )

  ;; Safety bookkeeping actions are intentionally not present as shortcuts.
  ;; All resource allocations and releases are explicit in the actions above
  ;; so violating plans (e.g., placing two items into a single slot) are impossible.
)