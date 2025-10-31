(define (problem meet-you-and-david)
  (:domain multi-agent-meeting)

  (:objects
    you david - agent
    golden_gate_park chinatown - location
    t540 t563 t960 t1065 t1200 t1305 - time
  )

  (:init
    ;; travel connectivity
    (travel golden_gate_park chinatown)
    (travel chinatown golden_gate_park)

    ;; precomputed spans (travel and meeting-length spans)
    (span23 t540 t563)

    (span105 t960 t1065)
    (span105 t1200 t1305)

    ;; allowed waiting transitions (discrete time jumps)
    (waitable t563 t960)
    (waitable t960 t1065)
    (waitable t1065 t1200)
    (waitable t1200 t1305)

    ;; initial locations at specific discrete times
    (at you golden_gate_park t540)
    (at david chinatown t960)

    ;; availability facts (precomputed)
    (available you t540)
    (available you t563)
    (available you t960)
    (available you t1065)
    (available you t1200)
    (available you t1305)

    (available david t960)
    (available david t1065)
    (available david t1200)
    (available david t1305)
  )

  (:goal (met))

  (:metric minimize (total-cost))
)