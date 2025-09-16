(define (problem integrated_meet_jessica)
  (:domain integrated_meeting_schedule)
  
  (:objects
    Presidio MarinaDistrict - location
    visitor jessica - person
  )
  
  (:init
    (at visitor Presidio)
    (at jessica MarinaDistrict)
    (can_meet jessica)
  )
  
  (:goal (meeting_successful))
)