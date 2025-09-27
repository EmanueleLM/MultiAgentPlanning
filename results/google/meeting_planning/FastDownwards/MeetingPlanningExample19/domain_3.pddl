(define (domain meeting-scheduling)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types agent place)
  (:predicates
    (at ?a - agent ?p - place)
    (meeting-initiated)
    (met-john)
  )
  (:functions
    (current-time)
  )

  (:action travel_traveler_ggp_to_ph
    :parameters ()
    :precondition (and
      (at traveler ggp)
    )
    :effect (and
      (not (at traveler ggp))
      (at traveler ph)
      (increase (current-time) 16)
    )
  )

  (:action travel_traveler_ph_to_ggp
    :parameters ()
    :precondition (and
      (at traveler ph)
    )
    :effect (and
      (not (at traveler ph))
      (at traveler ggp)
      (increase (current-time) 15)
    )
  )

  (:action traveler_initiate_meeting_with_john
    :parameters ()
    :precondition (and
      (at traveler ph)
      (at john ph)
      (not (meeting-initiated))
      (not (met-john))
      (>= (current-time) 1185)
      (<= (current-time) 1200)
    )
    :effect (and
      (meeting-initiated)
    )
  )

  (:action john_participate_meeting_with_traveler
    :parameters ()
    :precondition (and
      (meeting-initiated)
      (at traveler ph)
      (at john ph)
      (>= (current-time) 1185)
      (<= (current-time) 1200)
      (not (met-john))
    )
    :effect (and
      (not (meeting-initiated))
      (met-john)
      (increase (current-time) 45)
    )
  )
)