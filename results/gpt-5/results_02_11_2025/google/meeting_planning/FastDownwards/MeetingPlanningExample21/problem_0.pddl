(define (problem meet_margaret_chosen_0912_1545)
  (:domain mission_haight_meet)
  (:objects
    Mission_District Haight_Ashbury - location
    margaret - person
  )
  (:init
    (at Mission_District)
    (person_at margaret Haight_Ashbury)
    (available_slot margaret Haight_Ashbury)
  )
  (:goal
    (met margaret)
  )
)