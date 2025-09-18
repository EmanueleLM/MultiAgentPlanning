(define (problem meet-you-and-david)
  (:domain multi-agent-meeting)

  (:objects
    you david - agent
    golden_gate_park chinatown - location
    t540 t563 t937 t960 t1065 t1305 - time
  )

  (:init
    ;; travel links
    (travel golden_gate_park chinatown)
    (travel chinatown golden_gate_park)

    ;; travel duration (23 minutes) encoded for relevant departure/arrival pairs
    (span23 t937 t960)
    ;; (optional) early travel fragment (not required for the solution but provided)
    (span23 t540 t563)

    ;; meeting duration (105 minutes)
    (span105 t960 t1065)

    ;; waiting spans to allow staying at locations between key times
    (waitable t540 t937)
    (waitable t1065 t1305)

    ;; initial locations
    (at you golden_gate_park t540)
    ;; David is at Chinatown from 16:00 (t960) through later times
    (at david chinatown t960)
    (at david chinatown t1065)
    (at david chinatown t1305)

    ;; availability: you are available at your times, David is available during his window
    (available you t540)
    (available you t937)
    (available you t960)
    (available you t1065)

    (available david t960)
    (available david t1065)
    (available david t1305)
  )

  (:goal (met))
)