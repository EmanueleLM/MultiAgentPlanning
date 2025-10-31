(define (domain meeting-schedule-classical)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
    (travel-time-Bayview-RussianHill-23)
    (travel-time-RussianHill-Bayview-23)
    (meeting-length-75)
    (john-window-length-210)
    (john_available_for_75)
  )
  (:action travel-traveler-bayview-to-russianhill
    :parameters ()
    :precondition (and (at traveler Bayview))
    :effect (and (not (at traveler Bayview)) (at traveler RussianHill))
    :cost 23
  )
  (:action travel-traveler-russianhill-to-bayview
    :parameters ()
    :precondition (and (at traveler RussianHill))
    :effect (and (not (at traveler RussianHill)) (at traveler Bayview))
    :cost 23
  )
  (:action traveler-meet-john
    :parameters ()
    :precondition (and (at traveler RussianHill) (at john RussianHill) (john_available_for_75) (meeting-length-75))
    :effect (and (met))
    :cost 75
  )
)