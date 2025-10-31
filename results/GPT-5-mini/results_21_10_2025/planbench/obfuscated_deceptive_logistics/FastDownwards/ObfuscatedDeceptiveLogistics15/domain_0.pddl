(define (domain logistics-domain)
  (:requirements :typing :negative-preconditions :strips)
  (:types robot location package)

  (:predicates
    (at ?r - robot ?l - location)
    (at-pkg ?p - package ?l - location)
    (holding ?r - robot ?p - package)
    (free ?r - robot)
    (delivered ?p - package)
    (destination ?p - package ?l - location)
    (connected ?l1 - location ?l2 - location)
  )

  ;; Move a robot from one location to another along a connected edge
  (:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and
      (at ?r ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
    )
  )

  ;; Pickup a package at the robot's current location (robot must be free, package not yet delivered)
  (:action pickup
    :parameters (?r_p - robot ?pkg - package ?loc - location)
    :precondition (and
      (at ?r_p ?loc)
      (at-pkg ?pkg ?loc)
      (free ?r_p)
      (not (delivered ?pkg))
    )
    :effect (and
      (not (at-pkg ?pkg ?loc))
      (not (free ?r_p))
      (holding ?r_p ?pkg)
    )
  )

  ;; Drop off a package at the robot's current location (becomes an at-pkg at that location)
  (:action dropoff
    :parameters (?r_d - robot ?pkg_d - package ?loc_d - location)
    :precondition (and
      (at ?r_d ?loc_d)
      (holding ?r_d ?pkg_d)
    )
    :effect (and
      (at-pkg ?pkg_d ?loc_d)
      (not (holding ?r_d ?pkg_d))
      (free ?r_d)
    )
  )

  ;; Deliver a package when the robot is at the package's destination
  (:action deliver
    :parameters (?r_del - robot ?pkg_del - package ?loc_del - location)
    :precondition (and
      (at ?r_del ?loc_del)
      (holding ?r_del ?pkg_del)
      (destination ?pkg_del ?loc_del)
      (not (delivered ?pkg_del))
    )
    :effect (and
      (delivered ?pkg_del)
      (not (holding ?r_del ?pkg_del))
      (free ?r_del)
      (at-pkg ?pkg_del ?loc_del)
    )
  )
)