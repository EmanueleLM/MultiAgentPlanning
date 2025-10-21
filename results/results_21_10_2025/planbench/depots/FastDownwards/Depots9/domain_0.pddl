(define (domain robot-ops)
  (:requirements :strips :typing :negative-preconditions)
  (:types robot package location item)

  (:predicates
    (at ?r - robot ?l - location)
    (at-pkg ?p - package ?l - location)
    (holding ?r - robot ?p - package)
    (charged ?r - robot)
    (available-charger ?l - location)
    (at-item ?it - item ?l - location)
    (needs-inspection ?it - item)
    (inspected ?it - item)
    (defective ?it - item)
    (repaired ?it - item)
  )

  ;; Move action: requires robot to be charged. Moving consumes the charge.
  (:action move
    :parameters (?robot1 - robot ?from1 - location ?to1 - location)
    :precondition (and
      (at ?robot1 ?from1)
      (charged ?robot1)
    )
    :effect (and
      (not (at ?robot1 ?from1))
      (at ?robot1 ?to1)
      (not (charged ?robot1))
    )
  )

  ;; Pickup action: pick up a package located at the robot location.
  (:action pickup
    :parameters (?robot2 - robot ?pkg2 - package ?loc2 - location)
    :precondition (and
      (at ?robot2 ?loc2)
      (at-pkg ?pkg2 ?loc2)
    )
    :effect (and
      (holding ?robot2 ?pkg2)
      (not (at-pkg ?pkg2 ?loc2))
    )
  )

  ;; Dropoff action: drop a package the robot is holding at the current location.
  (:action dropoff
    :parameters (?robot3 - robot ?pkg3 - package ?loc3 - location)
    :precondition (and
      (at ?robot3 ?loc3)
      (holding ?robot3 ?pkg3)
    )
    :effect (and
      (at-pkg ?pkg3 ?loc3)
      (not (holding ?robot3 ?pkg3))
    )
  )

  ;; Charge action: robot charges at a location with an available charger.
  ;; The charger becomes unavailable while the robot is charged (exclusive).
  (:action charge
    :parameters (?robot4 - robot ?loc4 - location)
    :precondition (and
      (at ?robot4 ?loc4)
      (available-charger ?loc4)
    )
    :effect (and
      (charged ?robot4)
      (not (available-charger ?loc4))
    )
  )

  ;; Inspect action: robot inspects an item at the same location. Requires the robot to be charged.
  ;; Inspection consumes the charge and clears the needs-inspection flag.
  (:action inspect
    :parameters (?robot5 - robot ?item5 - item ?loc5 - location)
    :precondition (and
      (at ?robot5 ?loc5)
      (at-item ?item5 ?loc5)
      (charged ?robot5)
      (needs-inspection ?item5)
    )
    :effect (and
      (inspected ?item5)
      (not (needs-inspection ?item5))
      (not (charged ?robot5))
    )
  )

  ;; Repair action: robot repairs a defective item that has been inspected.
  ;; Repair requires the robot to be charged and consumes the charge.
  (:action repair
    :parameters (?robot6 - robot ?item6 - item ?loc6 - location)
    :precondition (and
      (at ?robot6 ?loc6)
      (inspected ?item6)
      (defective ?item6)
      (charged ?robot6)
    )
    :effect (and
      (repaired ?item6)
      (not (defective ?item6))
      (not (charged ?robot6))
    )
  )
)