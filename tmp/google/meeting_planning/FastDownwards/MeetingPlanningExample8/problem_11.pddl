(define (problem coordinated_meeting)
  (:domain integrated_schedule)

  (:objects
    traveler stephanie - agent
    chinatown marina_district - location
    ; Removed '105 - number' as it is not needed due to the prior removal of the (meeting-time ?duration - number) predicate
  )

  (:init
    (at traveler chinatown)
    (at stephanie marina_district)
    (available stephanie)
    ; Removed (meeting-time 105) because the corresponding predicate is removed in the domain
  )

  (:goal
    (meeting-planned traveler stephanie)
  )
)