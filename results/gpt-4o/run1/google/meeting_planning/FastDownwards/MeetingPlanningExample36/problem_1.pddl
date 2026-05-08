(define (problem san_francisco_day_trip)
  (:domain san_francisco_meeting)

  (:objects
    marina_district embarcadero - location
    barbara - person
    t9_00am t1_30pm t2_30pm t8_45pm - time
  )

  (:init
    (at marina_district)
    (time_reached t9_00am)
    (can_meet barbara embarcadero)
  )

  (:goal
    (meeting_scheduled barbara)
  )
)