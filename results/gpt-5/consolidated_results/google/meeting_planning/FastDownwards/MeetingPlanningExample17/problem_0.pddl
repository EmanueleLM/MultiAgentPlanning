(define (problem meet-matthew-problem)
  (:domain meet-matthew)
  (:objects
    trav - traveler
    alamo_square sunset_district - location
    matthew - person
    t09_00 t09_15 t09_30 t09_45
    t10_00 t10_15 t10_30 t10_45
    t11_00 t11_15 t11_30 t11_45
    t12_00 t12_15 t12_30 t12_45
    t13_00 t13_15 t13_30 t13_45
    t14_00 t14_15 t14_30 - timeslot
  )
  (:init
    ; Initial position and time
    (at trav alamo_square)
    (time t09_00)

    ; Meeting must occur at sunset_district
    (meeting-location matthew sunset_district)

    ; Successor relation over 15-minute slots from 09:00 to 14:30
    (next t09_00 t09_15)
    (next t09_15 t09_30)
    (next t09_30 t09_45)
    (next t09_45 t10_00)
    (next t10_00 t10_15)
    (next t10_15 t10_30)
    (next t10_30 t10_45)
    (next t10_45 t11_00)
    (next t11_00 t11_15)
    (next t11_15 t11_30)
    (next t11_30 t11_45)
    (next t11_45 t12_00)
    (next t12_00 t12_15)
    (next t12_15 t12_30)
    (next t12_30 t12_45)
    (next t12_45 t13_00)
    (next t13_00 t13_15)
    (next t13_15 t13_30)
    (next t13_30 t13_45)
    (next t13_45 t14_00)
    (next t14_00 t14_15)
    (next t14_15 t14_30)

    ; Meeting window: allowed 15-minute start slots within [13:30, 14:30)
    (in-window t13_30)
    (in-window t13_45)
    (in-window t14_00)
    (in-window t14_15)

    ; Directed travel duration for the chosen route (depart 13:15, arrive 13:30)
    (leg alamo_square sunset_district t13_15 t13_30)
  )

  ; Goal encodes the chosen schedule’s terminal conditions:
  ; - matthew has been met for a full 15-minute slot within window
  ; - ending at sunset_district at 13:45 (immediately after the 13:30–13:45 meeting)
  (:goal (and
    (met matthew)
    (at trav sunset_district)
    (time t13_45)
  ))
)