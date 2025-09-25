(define (problem meet-you-david)
  (:domain multi-agent-meeting)

  ;; Locations in the scenario
  (:objects
    home_y office cafe - location
  )

  (:init
    ;; initial positions
    (at-you home_y)
    (at-david office)

    ;; travel times (minutes) between locations (symmetric entries included)
    (= (travel-time home_y cafe) 30)
    (= (travel-time cafe home_y) 30)
    (= (travel-time home_y office) 45)
    (= (travel-time office home_y) 45)
    (= (travel-time cafe office) 15)
    (= (travel-time office cafe) 15)

    ;; Timed initial literals to model availability windows:
    ;; You (the user) are free starting at minute 120 and stop being free at minute 420.
    (at 120 (free-you))
    (at 420 (not (free-you)))

    ;; David is free starting at minute 150 and stops being free at minute 300.
    (at 150 (free-david))
    (at 300 (not (free-david)))
  )

  ;; Objective: ensure a meeting of at least 105 minutes occurs
  (:goal (met))

  ;; Try to minimize total time (encourage earliest meeting finish). Many planners respect this.
  (:metric minimize (total-time))
)