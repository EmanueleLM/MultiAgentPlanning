(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle airplane truck package location city - object)
  (:predicates
    (at ?v - vehicle ?loc - location)
    (at_package ?pkg - package ?loc - location)
    (in_city ?loc - location ?city - city)
    (at_airport ?loc - location)
    (in_vehicle ?pkg - package ?v - vehicle)
    (is_truck ?v - vehicle)
    (is_airplane ?v - vehicle)
  )

  (:action load_truck
    :parameters (?pkg - package ?trk - vehicle ?loc - location)
    :precondition (and (at ?trk ?loc) (at_package ?pkg ?loc) (is_truck ?trk))
    :effect (and (in_vehicle ?pkg ?trk) (not (at_package ?pkg ?loc)))
  )

  (:action unload_truck
    :parameters (?pkg - package ?trk - vehicle ?loc - location)
    :precondition (and (at ?trk ?loc) (in_vehicle ?pkg ?trk) (is_truck ?trk))
    :effect (and (at_package ?pkg ?loc) (not (in_vehicle ?pkg ?trk)))
  )

  (:action load_airplane
    :parameters (?pkg - package ?pln - vehicle ?loc - location)
    :precondition (and (at ?pln ?loc) (at_package ?pkg ?loc) (is_airplane ?pln))
    :effect (and (in_vehicle ?pkg ?pln) (not (at_package ?pkg ?loc)))
  )

  (:action unload_airplane
    :parameters (?pkg - package ?pln - vehicle ?loc - location)
    :precondition (and (at ?pln ?loc) (in_vehicle ?pkg ?pln) (is_airplane ?pln))
    :effect (and (at_package ?pkg ?loc) (not (in_vehicle ?pkg ?pln)))
  )

  (:action drive_truck
    :parameters (?trk - vehicle ?from ?to - location ?city - city)
    :precondition (and (at ?trk ?from) (in_city ?from ?city) (in_city ?to ?city) (is_truck ?trk))
    :effect (and (at ?trk ?to) (not (at ?trk ?from)))
  )

  (:action fly_airplane
    :parameters (?pln - vehicle ?from ?to - location)
    :precondition (and (at ?pln ?from) (at_airport ?from) (at_airport ?to) (is_airplane ?pln))
    :effect (and (at ?pln ?to) (not (at ?pln ?from)))
  )
)