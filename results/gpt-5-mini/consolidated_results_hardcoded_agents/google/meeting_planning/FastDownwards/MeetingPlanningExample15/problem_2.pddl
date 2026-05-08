(define (problem MeetingPlanningExample15-problem)
  (:domain MeetingPlanningExample15)
  (:objects
    traveler - agent
    russian_hill golden_gate_park - location
    time_0 time_219 time_240 time_555 time_574 - time
  )
  (:init
    ;; Initial location: arrival at Russian Hill at 09:00 represented by time_0
    (at traveler russian_hill time_0)

    ;; Explicit ordered stages (successor chain)
    (next time_0 time_219)   ;; 09:00 -> 12:39
    (next time_219 time_240) ;; 12:39 -> 13:00 (21 minutes)
    (next time_240 time_555) ;; 13:00 -> 18:15 (meeting interval)
    (next time_555 time_574) ;; 18:15 -> 18:34 (19 minutes)

    ;; Direction-aware travel allowances (encode asymmetric travel durations by mapping specific start->end stage pairs)
    ;; Russian Hill -> Golden Gate Park takes 21 minutes: from time_219 to time_240
    (travel-allowed russian_hill golden_gate_park time_219 time_240)
    ;; Golden Gate Park -> Russian Hill takes 19 minutes: from time_555 to time_574
    (travel-allowed golden_gate_park russian_hill time_555 time_574)

    ;; John's availability: present at Golden Gate Park throughout [time_240, time_555]
    (john-available time_240)
    (john-available time_555)

    ;; Meeting interval that is contiguous and satisfies the minimum meeting duration requirement (>= 90 minutes).
    ;; This explicit predicate encodes the chosen contiguous interval 13:00 (time_240) to 18:15 (time_555) = 315 minutes.
    (meeting-interval time_240 time_555)
  )
  (:goal (and
    (met-john)
  ))
)