(define (domain warehouse-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    robot picker_robot stacker_robot - robot
    item
    location
    pallet
    phase
  )

  (:predicates
    ;; robot and item locations
    (at ?r - robot ?l - location)
    (item-at ?i - item ?l - location)

    ;; holding state separated per role
    (holding-picker ?r - picker_robot ?i - item)
    (holding-stacker ?r - stacker_robot ?i - item)

    ;; simple resource: whether a robot has free hands (enforces single-item hold)
    (free-hands ?r - robot)

    ;; task completion flags
    (picked ?i - item)
    (stacked ?i - item)
    (item-on-pallet ?i - item ?p - pallet)

    ;; pallet location
    (pallet-at ?p - pallet ?l - location)

    ;; explicit phase sequencing and role binding to phases
    (current-phase ?ph - phase)
    (phase-next ?ph1 - phase ?ph2 - phase)
    (phase-is-pick ?ph - phase ?i - item)
    (phase-is-stack ?ph - phase ?i - item)
  )

  ;; Picker movement (distinct role name)
  (:action picker-move
    :parameters (?r - picker_robot ?from - location ?to - location)
    :precondition (and (at ?r ?from))
    :effect (and (not (at ?r ?from)) (at ?r ?to))
  )

  ;; Picker picks an item from its shelf/location into the picker robot's hands.
  ;; This action can only occur in a phase explicitly declared as a pick phase for that item.
  (:action picker-pick
    :parameters (?r - picker_robot ?i - item ?loc - location ?ph - phase)
    :precondition (and
      (at ?r ?loc)
      (item-at ?i ?loc)
      (free-hands ?r)
      (current-phase ?ph)
      (phase-is-pick ?ph ?i)
    )
    :effect (and
      (not (item-at ?i ?loc))
      (holding-picker ?r ?i)
      (not (free-hands ?r))
      (picked ?i)
    )
  )

  ;; Picker places the held item into a buffer location visible to the stacker.
  ;; Must be executed in the same pick phase that enabled the pick for that item.
  (:action picker-place-buffer
    :parameters (?r - picker_robot ?i - item ?buffer - location ?ph - phase)
    :precondition (and
      (at ?r ?buffer)
      (holding-picker ?r ?i)
      (current-phase ?ph)
      (phase-is-pick ?ph ?i)
    )
    :effect (and
      (item-at ?i ?buffer)
      (not (holding-picker ?r ?i))
      (free-hands ?r)
    )
  )

  ;; Stacker movement (distinct role name)
  (:action stacker-move
    :parameters (?r - stacker_robot ?from - location ?to - location)
    :precondition (and (at ?r ?from))
    :effect (and (not (at ?r ?from)) (at ?r ?to))
  )

  ;; Stacker picks an item from the buffer into stacker hands.
  ;; Only allowed in a phase explicitly declared as the stack phase for that item.
  (:action stacker-pick-buffer
    :parameters (?r - stacker_robot ?i - item ?buffer - location ?ph - phase)
    :precondition (and
      (at ?r ?buffer)
      (item-at ?i ?buffer)
      (free-hands ?r)
      (current-phase ?ph)
      (phase-is-stack ?ph ?i)
    )
    :effect (and
      (not (item-at ?i ?buffer))
      (holding-stacker ?r ?i)
      (not (free-hands ?r))
    )
  )

  ;; Stacker places the held item onto a pallet that is at the same location as the stacker.
  ;; Must be executed in the stack phase that corresponds to that item.
  (:action stacker-place-pallet
    :parameters (?r - stacker_robot ?i - item ?pal - pallet ?loc - location ?ph - phase)
    :precondition (and
      (holding-stacker ?r ?i)
      (at ?r ?loc)
      (pallet-at ?pal ?loc)
      (current-phase ?ph)
      (phase-is-stack ?ph ?i)
    )
    :effect (and
      (stacked ?i)
      (item-on-pallet ?i ?pal)
      (not (holding-stacker ?r ?i))
      (free-hands ?r)
    )
  )

  ;; Advance to the next phase after a pick-phase is complete for the designated item.
  ;; Explicit: requires the picked flag so planner cannot advance prematurely.
  (:action advance-after-pick
    :parameters (?ph1 - phase ?ph2 - phase ?i - item)
    :precondition (and
      (current-phase ?ph1)
      (phase-next ?ph1 ?ph2)
      (phase-is-pick ?ph1 ?i)
      (picked ?i)
    )
    :effect (and
      (not (current-phase ?ph1))
      (current-phase ?ph2)
    )
  )

  ;; Advance to the next phase after a stack-phase is complete for the designated item.
  (:action advance-after-stack
    :parameters (?ph1 - phase ?ph2 - phase ?i - item)
    :precondition (and
      (current-phase ?ph1)
      (phase-next ?ph1 ?ph2)
      (phase-is-stack ?ph1 ?i)
      (stacked ?i)
    )
    :effect (and
      (not (current-phase ?ph1))
      (current-phase ?ph2)
    )
  )
)