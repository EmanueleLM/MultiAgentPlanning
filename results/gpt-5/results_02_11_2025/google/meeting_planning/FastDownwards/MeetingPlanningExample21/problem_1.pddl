(define (problem meet_margaret_0912_to_1545)
  (:domain sf_meeting_margaret)
  (:objects
    Mission_District Haight_Ashbury - location
    margaret - person
  )
  (:init
    (at Mission_District)
    (person_at margaret Haight_Ashbury)
    (chosen_departure_0900)
    (slot_0912_1545_available margaret Haight_Ashbury)
  )
  (:goal
    (met margaret)
  )
)