(define (problem coordinated_meeting)
  (:domain integrated_schedule)

  (:objects
    traveler stephanie - agent
    chinatown marina_district - location
  )

  (:init
    (at traveler chinatown)
    (available-at stephanie marina_district)
  )

  (:goal
    (and
      (meeting-scheduled)
      (time-spent traveler stephanie)
    )
  )
)