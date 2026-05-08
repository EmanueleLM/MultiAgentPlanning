(define (problem meeting_planning_example11-problem)
  (:domain meeting_planning_example11)

  ;; NOTE: Time is encoded as discrete timepoints. Mapping used in this instance:
  ;;   t0900 = 09:00
  ;;   t1335 = 13:35 (chosen departure time from Nob Hill)
  ;;   t1400 = 14:00
  ;;   t1515 = 15:15 (14:00 + 75 minutes)
  ;;   t2030 = 20:30
  ;;
  ;; Travel durations enforced by specific travel_leg facts:
  ;;   nobhill -> sunset_district: t1335 -> t1400 (25 minutes)
  ;;   sunset_district -> nobhill: not provided (no travel leg invented)

  (:objects
    nobhill sunset_district - location
    t0900 t1335 t1400 t1515 t2030 - timepoint
  )

  (:init
    ;; Initial location/time: traveler arrives at Nob Hill at 09:00.
    (at nobhill t0900)

    ;; Allow waiting at Nob Hill from 09:00 until 13:35 (to model idle time before departing).
    (wait_leg nobhill t0900 t1335)

    ;; Travel leg: Nob Hill -> Sunset District takes 25 minutes (13:35 -> 14:00).
    (travel_leg nobhill sunset_district t1335 t1400)

    ;; Carol's declared presence sampled at relevant timepoints.
    ;; She is at Sunset District from 14:00 to 20:30. We provide endpoints used by meeting windows.
    (carol_present t1400)
    (carol_present t1515)
    (carol_present t2030)

    ;; Explicit meeting window encoding a single continuous 75-minute slot:
    ;; 14:00 (t1400) -> 15:15 (t1515) is 75 minutes and lies within Carol's availability.
    (meet_window sunset_district t1400 t1515)
  )

  ;; Hard requirement: traveler must meet Carol for at least the specified continuous 75-minute window.
  (:goal (met_carol))
)