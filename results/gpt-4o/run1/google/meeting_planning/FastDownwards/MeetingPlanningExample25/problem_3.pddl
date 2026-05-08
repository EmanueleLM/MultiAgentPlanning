(define (problem meeting_schedule)
  (:domain friend_meeting)
  (:objects 
    golden_gate_park chinatown - location
    t9am t4pm t615pm t645pm t715pm t745pm t815pm t845pm t915pm t945pm_end - time_point
    david - person
  )
  (:init
    (at david chinatown)
    (is_at golden_gate_park t9am)
    (can_travel golden_gate_park chinatown)
    (can_travel chinatown golden_gate_park)
    (before t9am t4pm)
    (before t4pm t945pm_end)
    (before t615pm t645pm)
    (before t645pm t715pm)
    (before t715pm t745pm)
    (before t745pm t815pm)
    (before t815pm t845pm)
    (before t845pm t915pm)
    (before t9am t615pm)
    (before t9am t945pm_end)
    (david_available t4pm)
    (david_available t615pm)
    (david_available t645pm)
    (david_available t715pm)
    (david_available t745pm)
    (david_available t815pm)
    (david_available t845pm)
    (david_available t915pm)
    (david_at_chinatown t4pm) ; mark David's presence interval
  )
  (:goal (and
    (met david)
  ))
)