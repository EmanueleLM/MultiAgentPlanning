(define (problem coordinated_meeting)
  (:domain integrated_schedule)

  (:objects
    traveler stephanie - agent
    chinatown marina_district - location
    105 - number
  )

  (:init
    (at traveler chinatown)
    (at stephanie marina_district)
    (available stephanie)
    (meeting-time 105)
  )

  (:goal
    (meeting-planned traveler stephanie)
  ))