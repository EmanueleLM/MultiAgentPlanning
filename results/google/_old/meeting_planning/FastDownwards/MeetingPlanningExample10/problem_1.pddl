(define (problem meet-james-combined-problem-symbolic)
  (:domain meet-james-combined-symbolic)

  (:objects
    visitor james - person
    golden_gate_park marina_district - location
    t540 t599 t615 t630 - timepoint
  )

  (:init
    ;; Precomputed relations (arithmetic replaced by predicates)
    ;; Travel times encoded as relations between timepoints (ts -> te where te = ts + duration)
    (travel16 t599 t615)
    ;; Example travel18 relation (not used in this particular plan but provided for completeness)
    (travel18 t615 t633)

    ;; Later relations to allow waiting (precomputed)
    (later t540 t599)
    (later t599 t615)

    ;; Meeting length precomputed (15 minutes block)
    (meeting15 t615 t630)

    ;; James availability window includes the meeting interval (precomputed availability interval)
    (avail-interval james marina_district t615 t630)

    ;; Initial locations at specific timepoints
    ;; Visitor is at Golden Gate Park at current time t540 (09:00 = 540)
    (at visitor golden_gate_park t540)
    ;; James will be at Marina District starting at t615 (10:15)
    (at james marina_district t615)
  )

  ;; Goal: ensure visitor meets James for at least the symbolic 15-minute block.
  (:goal (met visitor james))

  ;; Optimize: minimize sum of action costs (travel durations encoded as action costs)
  (:metric minimize (total-cost))
)