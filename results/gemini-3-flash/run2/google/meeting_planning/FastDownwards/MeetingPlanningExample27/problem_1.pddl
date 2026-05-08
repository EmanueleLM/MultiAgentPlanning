(define (problem meeting_planning_example_27)
  (:domain meeting_planning)
  (:objects
    marina_district pacific_heights - location
    t_0900 t_0907 t_1900 t_1915 t_1930 t_1945 - time
    margaret - person
  )
  (:init
    ;; Starting state: arrive at Marina District at 9:00 AM
    (at marina_district)
    (current_time t_0900)

    ;; Margaret's presence at Pacific Heights from 7:00 PM to 7:45 PM
    ;; We model this by discretizing the 45-minute window into 15-minute segments.
    (person_present margaret pacific_heights t_1900)
    (person_present margaret pacific_heights t_1915)
    (person_present margaret pacific_heights t_1930)

    ;; Travel duration from Marina District to Pacific Heights (7 minutes)
    (travel_duration marina_district pacific_heights t_0900 t_0907)

    ;; Meeting duration (minimum 15 minutes)
    (meet_duration margaret t_1900 t_1915)
    (meet_duration margaret t_1915 t_1930)
    (meet_duration margaret t_1930 t_1945)

    ;; Symbolic chronological order of time points for waiting
    (next t_0907 t_1900)
    (next t_1900 t_1915)
    (next t_1915 t_1930)
    (next t_1930 t_1945)
  )
  (:goal
    (and
      ;; The goal is to meet Margaret
      (met margaret)
    )
  )
)