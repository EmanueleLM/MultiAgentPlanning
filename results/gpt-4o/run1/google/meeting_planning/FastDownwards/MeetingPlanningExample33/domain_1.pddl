(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend)
  (:predicates
    (at_location ?loc - location)
    (friend_available ?friend - friend ?loc - location)
    (met_friend ?friend - friend)
  )
  (:action move_to_union_square
    :parameters ()
    :precondition (and (at_location sunset_district))
    :effect (and (not (at_location sunset_district)) (at_location union_square))
  )
  (:action move_to_sunset_district
    :parameters ()
    :precondition (and (at_location union_square))
    :effect (and (not (at_location union_square)) (at_location sunset_district))
  )
  (:action meet_sarah
    :parameters ()
    :precondition (and (at_location union_square) (friend_available sarah union_square) (not (met_friend sarah)))
    :effect (met_friend sarah)
  )
)