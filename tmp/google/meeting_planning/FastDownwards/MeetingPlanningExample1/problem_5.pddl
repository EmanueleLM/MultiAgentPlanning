(define (problem coordinate_meeting_with_betty)
  (:domain integrated_meeting_planner)
  (:objects
    richmond_district financial_district - location
    you betty - person
  )
  (:init
    (at you richmond_district)
    (at betty financial_district)
    (available_for_meeting betty)
    (can-meet-betty you)
  )
  (:goal
    (meeting-minimum-time-satisfied)
  )
)