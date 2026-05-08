(define (problem meet_kenneth)
  (:domain san_francisco_meeting)

  (:objects
    self - person
    kenneth - person
    fishermans_wharf nob_hill - location
    morning afternoon evening - time_interval
  )

  (:init
    (at self fishermans_wharf)
    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)
    (can_meet kenneth nob_hill afternoon)
    (time_for_meeting afternoon))

  (:goal
    (met kenneth))
)