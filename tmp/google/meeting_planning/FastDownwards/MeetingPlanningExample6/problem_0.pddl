(define (problem multi-agent-meet-problem)
  (:domain multi-agent-meet)
  (:objects
     fishermans_wharf nob_hill - location
  )
  (:init
     ;; Start: Visitor and Kenneth both at Fishermans Wharf
     (at_visitor fishermans_wharf)
     (kenneth_at fishermans_wharf)
     (= (current_time) 540)  ;; 9:00 AM
  )
  (:goal (met_kenneth))  ;; Meet Kenneth for at least 90 minutes
)