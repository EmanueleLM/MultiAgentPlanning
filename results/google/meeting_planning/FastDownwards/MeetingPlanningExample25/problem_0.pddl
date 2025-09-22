(define (problem meet-you-and-david)
  (:domain multi-agent-meeting)
  (:objects
    you david - agent
    home_you home_david cafe office - location
  )

  ;; initial state: where agents start and the numeric/time settings
  (:init
    ;; starting time
    (= (now) 0)

    ;; starting locations
    (at you home_you)
    (at david home_david)

    ;; travel times (minutes) between relevant locations
    ;; travel-time is asymmetric entries can be added as needed.
    (= (travel-time home_you cafe) 30)
    (= (travel-time home_you office) 10)
    (= (travel-time cafe home_you) 30)
    (= (travel-time office home_you) 10)

    (= (travel-time home_david cafe) 20)
    (= (travel-time home_david office) 45)
    (= (travel-time cafe home_david) 20)
    (= (travel-time office home_david) 45)

    ;; availability windows (minutes since day start) for each agent.
    ;; These windows should permit at least a 105-minute meeting after travel.
    ;; Example values below ensure feasibility; they can be adjusted to model
    ;; different availabilities.
    (= (earliest you) 0)
    (= (latest you) 1440)

    (= (earliest david) 0)
    (= (latest david) 1440)
  )

  ;; Goal: ensure the two agents meet for at least 105 minutes.
  (:goal (met))

  ;; Optimize to minimize the finishing time (the global now), selecting the
  ;; earliest possible meeting plan given travel and availability.
  (:metric minimize (now))
)