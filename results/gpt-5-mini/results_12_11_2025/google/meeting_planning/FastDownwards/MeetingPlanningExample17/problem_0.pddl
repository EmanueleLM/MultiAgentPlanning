(define (problem traveler-problem)
  (:domain traveler-domain)

  ;; Objects
  (:objects
    alamo_square sunset_district - location
    matthew - person

    ;; Timeslots: 15-minute increments from 09:00 to 14:30.
    ;; t0900 = 09:00, t0915 = 09:15, ..., t1430 = 14:30
    t0900 t0915 t0930 t0945 t1000 t1015 t1030 t1045
    t1100 t1115 t1130 t1145 t1200 t1215 t1230 t1245
    t1300 t1315 t1330 t1345 t1400 t1415 t1430 - timeslot
  )

  ;; Initial state:
  ;; - The agent starts at alamo_square at 09:00.
  ;; - A single directed travel route is available from alamo_square departing at 12:30
  ;;   and arriving at sunset_district at 13:30, occupying the intermediate slots
  ;;   12:45, 13:00, 13:15 (i.e., travel duration = 1 hour).
  ;; - Matthew is present at sunset_district at 13:30 and 13:45 so the meeting can occur.
  ;; Comments below indicate the human-readable timestamps intended for those slot constants.
  (:init
    ;; Starting location at 09:00
    (at alamo_square t0900)

    ;; travel-route: depart 12:30 -> intermediate 12:45,13:00,13:15 -> arrive 13:30
    ;; intended timestamps:
    ;;   t1230 = 12:30 (departure)
    ;;   t1245 = 12:45 (in-transit)
    ;;   t1300 = 13:00 (in-transit)
    ;;   t1315 = 13:15 (in-transit)
    ;;   t1330 = 13:30 (arrival)
    (travel-route alamo_square sunset_district t1230 t1245 t1300 t1315 t1330)

    ;; Matthew is at sunset_district at meeting start (13:30) and meeting finish (13:45).
    ;; These facts ensure Matthew's presence for the required 15-minute meeting window.
    (person-at matthew sunset_district t1330)
    (person-at matthew sunset_district t1345)

    ;; Successor (next) relations for contiguous 15-minute slots
    ;; (These enforce temporal contiguity; stay/travel actions require next relationships.)
    (next t0900 t0915)
    (next t0915 t0930)
    (next t0930 t0945)
    (next t0945 t1000)
    (next t1000 t1015)
    (next t1015 t1030)
    (next t1030 t1045)
    (next t1045 t1100)
    (next t1100 t1115)
    (next t1115 t1130)
    (next t1130 t1145)
    (next t1145 t1200)
    (next t1200 t1215)
    (next t1215 t1230)
    (next t1230 t1245)
    (next t1245 t1300)
    (next t1300 t1315)
    (next t1315 t1330)
    (next t1330 t1345)
    (next t1345 t1400)
    (next t1400 t1415)
    (next t1415 t1430)
  )

  ;; Goal:
  ;; - Meet Matthew for at least 15 minutes at sunset_district within 13:30-14:30.
  ;;   The chosen schedule is: depart alamo_square at 12:30, travel (1 hour), arrive at
  ;;   sunset_district at 13:30, start meeting at 13:30 and finish at 13:45.
  ;; - The final required terminal condition is to have met Matthew and to be at
  ;;   sunset_district at 13:45 (immediately after the required meeting).
  (:goal
    (and
      (met matthew)
      (at sunset_district t1345)
    )
  )
)