(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place time)
  (:constants traveler john - agent ggp ph - place)
  (:predicates
    (at ?a - agent ?p - place)
    (now ?t - time)
    (john-available-start ?t - time)
    (meeting-initiated)
    (met-john)
    (plus15 ?t1 - time ?t2 - time)
    (plus16 ?t1 - time ?t2 - time)
    (plus45 ?t1 - time ?t2 - time)
  )

  (:action travel_traveler_ggp_to_ph
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at traveler ggp)
      (now ?t1)
      (plus16 ?t1 ?t2)
    )
    :effect (and
      (not (at traveler ggp))
      (at traveler ph)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action travel_traveler_ph_to_ggp
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at traveler ph)
      (now ?t1)
      (plus15 ?t1 ?t2)
    )
    :effect (and
      (not (at traveler ph))
      (at traveler ggp)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action traveler_initiate_meeting_with_john
    :parameters (?t - time)
    :precondition (and
      (at traveler ph)
      (at john ph)
      (not (meeting-initiated))
      (not (met-john))
      (now ?t)
      (john-available-start ?t)
    )
    :effect (and
      (meeting-initiated)
    )
  )

  (:action john_participate_meeting_with_traveler
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (meeting-initiated)
      (at traveler ph)
      (at john ph)
      (not (met-john))
      (now ?t1)
      (plus45 ?t1 ?t2)
    )
    :effect (and
      (not (meeting-initiated))
      (met-john)
      (not (now ?t1))
      (now ?t2)
    )
  )
)