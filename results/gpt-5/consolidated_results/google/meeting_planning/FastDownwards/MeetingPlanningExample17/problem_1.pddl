(define (problem MeetingPlanningExample17-problem)
  (:domain meet-matthew-exact)
  (:objects
    trav - traveler
    alamo_square sunset_district - location
    matthew - person
    t09_00 t13_14 t13_30 t14_30 - time
  )

  (:init
    ; Initial state at 09:00 at Alamo Square
    (at trav alamo_square)
    (time t09_00)

    ; Matthew can be met only at Sunset District
    (meeting-location matthew sunset_district)

    ; Time advancement: a single buffered wait from 09:00 to 13:14
    ; Comment: this encodes idle/buffer time aggregated without minute-by-minute steps.
    (advance t09_00 t13_14)

    ; Directed travel leg with exact 16-minute duration:
    ; depart 13:14 from Alamo Square, arrive 13:30 at Sunset District
    (leg alamo_square sunset_district t13_14 t13_30)

    ; Meeting span fully within Matthew's availability [13:30, 14:30],
    ; chosen to maximize meeting duration (60 minutes).
    (meeting-span t13_30 t14_30)
  )

  ; Goal: meet Matthew (at least once for a valid span within his window).
  (:goal (and
    (met matthew)
  ))
)