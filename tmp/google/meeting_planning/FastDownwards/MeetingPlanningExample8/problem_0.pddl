(define (problem coordinated_meeting)
  (:domain integrated_schedule)

  (:objects
    traveler stephanie - agent
    chinatown marina_district - location
    duration_105_duration - number
  )

  (:init
    (at traveler chinatown)
    (available-at stephanie marina_district)
    (= duration_105_duration 105)
  )

  (:goal
    (and
      (meeting-scheduled)
      (time-spent traveler stephanie duration_105_duration)
    )
  )
)