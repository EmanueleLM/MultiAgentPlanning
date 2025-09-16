(define (problem coordinated_meeting)
  (:domain integrated_schedule)

  (:objects
    traveler stephanie - agent
    chinatown marina_district - location
  )

  (:init
    (at traveler chinatown)
    (at stephanie marina_district)
    (available stephanie)
    (available traveler) 
  )

  (:goal
    (and (meeting-planned traveler stephanie))
  )
)