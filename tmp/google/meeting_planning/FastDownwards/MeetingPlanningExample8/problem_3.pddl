(define (problem coordinated_meeting)
  (:domain integrated_schedule)

  (:objects
    traveler stephanie - agent
    chinatown marina_district - location
  )

  (:init
    (at traveler chinatown)
    (at stephanie marina_district) ; Considering Stephanie is already there at 9:00 AM.
  )

  (:goal
    (meeting-planned traveler stephanie)
  )
)