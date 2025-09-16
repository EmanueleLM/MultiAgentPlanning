(define (problem integrated_meet_jessica)
  (:domain integrated_meeting_schedule)
  
  (:objects
    Presidio MarinaDistrict - location
    visitor Jessica - person
  )
  
  (:init
    (= (current-time) 900)  ; 09:00 in minutes
    (at visitor Presidio)
    (at Jessica MarinaDistrict)
    (can_meet Jessica)
  )
  
  (:goal (meeting_successful))
)