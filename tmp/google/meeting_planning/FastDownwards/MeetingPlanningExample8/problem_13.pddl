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
    (travel-time chinatown marina_district 12)
    (travel-time marina_district chinatown 16)
  )

  (:goal
    (meeting-planned traveler stephanie)
  )
)