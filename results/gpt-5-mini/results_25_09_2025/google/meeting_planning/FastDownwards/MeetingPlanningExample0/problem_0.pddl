(define (problem meet-steph)
  (:domain meetup)
  (:objects
    you stephanie - agent
    marina mission - location
  )

  ;; Interpretation:
  ;; Plan start time 0 corresponds to 9:00AM.
  ;; - Stephanie will be at Mission District from 10:30AM to 1:30PM,
  ;;   which is 90 minutes to 270 minutes after plan start (9:00AM).
  ;; - Travel times are given in minutes and encoded as action durations:
  ;;   Marina->Mission = 20, Mission->Marina = 19.
  (:init
    ;; You arrive at Marina District at 9:00AM (plan time 0).
    (at you marina)

    ;; Stephanie becomes present at mission at plan time 90 (10:30AM)
    ;; and stops being present at plan time 270 (13:30 / 1:30PM).
    (at 90 (at stephanie mission))
    (at 270 (not (at stephanie mission)))
  )

  ;; Goal: you and Stephanie have met for at least 120 minutes.
  ;; The "meet" action has fixed duration 120, so achieving (met you stephanie)
  ;; satisfies the requirement.
  (:goal (met you stephanie))
)