(define (problem meeting-problem)
  (:domain meeting-planning)
  (:init
    ;; Traveler arrives in Chinatown at 09:00
    (at traveler chinatown)
    (current_time t0900)

    ;; Explicit timeline edges (ordered symbolic times). Edges encode required durations:
    ;; - t0900 -> t1122 (wait up to departure to catch earliest meeting)
    ;; - t1122 -> t1130 (8-minute travel arrival at 11:30)
    ;; - t1130 -> t1245 (75-minute meeting window: 11:30 -> 12:45)
    ;; - t1245 -> t1352 (waiting window)
    ;; - t1352 -> t1400 (8-minute travel arrival at 14:00)
    ;; - t1400 -> t1515 (75-minute meeting window: 14:00 -> 15:15)
    (next_time t0900 t1122)
    (next_time t1122 t1130)
    (next_time t1130 t1245)
    (next_time t1245 t1352)
    (next_time t1352 t1400)
    (next_time t1400 t1515)

    ;; Joseph's availability: continuous window from 11:30 to 15:15 is modeled by marking
    ;; the relevant timepoints within that window as available.
    (joseph_available t1130)
    (joseph_available t1245)
    (joseph_available t1400)
    (joseph_available t1515)
  )
  (:goal (met traveler))
)