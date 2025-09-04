(define (domain integrated-meeting-fd)
  (:requirements :strips :typing :action-costs :adl)
  (:types location person - object time-point)
  (:predicates 
    (at ?person - person ?loc - location)
    (meeting-scheduled ?person1 - person ?person2 - person)
    (next-time ?t1 ?t2 - time-point)
    (traveler-can-travel)
    (traveler-can-meet)
    (james-can-meet)
    (james-present-at ?loc - location)
  )
  (:functions 
    (total-cost)
  )
  (:action traveler-travel-m-d-to-a-s
    :parameters ()
    :precondition (and
                    (at traveler marina-district)
                    (traveler-can-travel)
                  )
    :effect (and
              (not (at traveler marina-district))
              (at traveler alamo-square)
              (not (traveler-can-travel))
              (increase (total-cost) 15)
            )
  )
  (:action traveler-meet
    :parameters ()
    :precondition (and
                    (at traveler alamo-square)
                    (james-can-meet)
                    (not (meeting-scheduled traveler james))
                  )
    :effect (and
              (meeting-scheduled traveler james)
              (not (traveler-can-meet))
              (increase (total-cost) -75)
            )
  )
  (:action james-present
    :parameters ()
    :precondition (and
                    (james-present-at alamo-square)
                  )
    :effect (and
              (james-can-meet)
              (not (james-present-at alamo-square))
            )
  )
  (:action reset-travel-condition
    :parameters ()
    :precondition (and (not (traveler-can-travel)))
    :effect (and (traveler-can-travel))
  )
  (:action reset-meet-condition
    :parameters ()
    :precondition (and (not (traveler-can-meet)))
    :effect (and (traveler-can-meet) (james-can-meet))
  ))