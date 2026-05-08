(define (problem meeting_planning_example_27)
  (:domain meeting_planning)
  (:objects
    myself margaret - person
    marina_district pacific_heights - location
    t_0900 t_1853 t_1900 t_1915 t_1945 t_1951 - time
  )

  (:init
    ;; Initial state: Myself at Marina District at 9:00 AM
    (at myself marina_district)
    (cur_time t_0900)

    ;; Waiting from arrival until it's time to travel
    (successor t_0900 t_1853)

    ;; Travel from Marina District to Pacific Heights (7 minutes)
    ;; 18:53 to 19:00 = 7 minutes
    (can_travel marina_district pacific_heights t_1853 t_1900)

    ;; Margaret availability at Pacific Heights (7:00 PM to 7:45 PM)
    ;; Meeting her for 15 minutes (19:00 to 19:15)
    (can_meet margaret pacific_heights t_1900 t_1915)

    ;; Passage of time after the meeting
    (successor t_1915 t_1945)

    ;; Return travel from Pacific Heights to Marina District (6 minutes)
    ;; 19:45 to 19:51 = 6 minutes
    (can_travel pacific_heights marina_district t_1945 t_1951)
  )

  (:goal 
    (and 
      (met margaret)
    )
  )
)