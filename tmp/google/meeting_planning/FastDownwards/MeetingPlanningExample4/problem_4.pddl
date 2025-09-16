(define (problem integrated_meet_jessica)
  (:domain integrated_meeting_schedule)
  
  (:objects
    Presidio MarinaDistrict - location
    visitor Jessica - person
  )
  
  (:init
    (at visitor Presidio)
    (at Jessica MarinaDistrict)
    (can_meet Jessica)
  )
  
  (:goal (meeting_successful))
)