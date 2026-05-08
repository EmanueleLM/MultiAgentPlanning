(define (problem visit_san_francisco)
  (:domain meet_friends)

  (:objects
    the_castro sunset_district - location
    deborah - person
    time_930am time_215pm time_330pm time_800pm - time
  )

  (:init
    (at_location self the_castro)
    (current_time time_930am)
    (available deborah time_330pm)
  )

  (:goal (and
    (visited sunset_district)
    (meeting_planned_with deborah)
  ))
)