(define (problem integrated_meet_jessica)
  (:domain integrated_meeting_schedule)
  
  (:objects
    Presidio MarinaDistrict - location
    visitor jessica - person
    t_09_00 t_09_10 t_09_15 t_09_30 t_10_15 t_17_45 - time
  )
  
  (:init
    (at visitor Presidio)
    (at jessica MarinaDistrict)
    (current_time t_09_00)
    (meeting_window jessica t_09_15 t_17_45)
  )
  
  (:goal (meeting_complete))
)