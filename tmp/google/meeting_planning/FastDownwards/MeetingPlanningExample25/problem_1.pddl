(define (problem meet-you-and-david)
  (:domain multi-agent-meeting)

  (:objects
    you david - agent
    GoldenGatePark Chinatown - location
    t540 t563 t960 t1065 t1200 t1305 - time
  )

  (:init
    ;; Travel links (as symbolic relations). Travel time between Golden Gate Park and Chinatown is 23 minutes.
    (travel GoldenGatePark Chinatown)
    (travel Chinatown GoldenGatePark)

    ;; Discrete spans precomputed for the model:
    ;; 23-minute travel span
    (span23 t540 t563)

    ;; 105-minute meeting spans (possible meeting windows that end within David's availability)
    (span105 t960 t1065)
    (span105 t1200 t1305)

    ;; Waitable intervals (coarse-grained intervals used by wait actions)
    (waitable t563 t960)
    (waitable t960 t1065)
    (waitable t1065 t1200)
    (waitable t1200 t1305)

    ;; Initial positions and times
    ;; You arrive at Golden Gate Park at 09:00 -> represented as t540
    (at you GoldenGatePark t540)

    ;; David will be at Chinatown from 16:00 to 21:45 -> represented by presence at t960 (16:00)
    ;; and he can wait forward through the listed intervals to remain at Chinatown.
    (at david Chinatown t960)

    ;; Availability per discrete timepoints (coarse-grained)
    ;; You are available at all listed time points (you can wait and travel).
    (available you t540)
    (available you t563)
    (available you t960)
    (available you t1065)
    (available you t1200)
    (available you t1305)

    ;; David is available from 16:00 (t960) through 21:45 (t1305).
    (available david t960)
    (available david t1065)
    (available david t1200)
    (available david t1305)
  )

  ;; Goal: ensure meeting of at least 105 minutes occurs (met becomes true).
  (:goal (met))

  ;; Minimize total elapsed time cost (encoded via action costs).
  (:metric minimize (total-cost))
)