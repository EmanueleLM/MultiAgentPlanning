(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    me margaret - person
    marina_district pacific_heights - location
    t_0900 t_0907 t_1853 t_1900 t_1915 t_1930 t_1945 - time
  )
  (:init
    (at me marina_district)
    (current_time t_0900)

    ;; Schedule Option 1: Travel early to Pacific Heights
    ;; 9:00 AM to 9:07 AM travel (7 mins)
    (can_travel marina_district pacific_heights t_0900 t_0907)
    ;; Wait at Pacific Heights until Margaret arrives
    (can_wait pacific_heights t_0907 t_1900)

    ;; Schedule Option 2: Wait at Marina District then travel
    ;; 9:00 AM to 6:53 PM wait (9h 53m)
    (can_wait marina_district t_0900 t_1853)
    ;; 6:53 PM to 7:00 PM travel (7 mins)
    (can_travel marina_district pacific_heights t_1853 t_1900)

    ;; Margaret's availability at Pacific Heights (7:00 PM to 7:45 PM)
    ;; Discrete 15-minute slots to satisfy the 15-minute requirement
    (available margaret pacific_heights t_1900 t_1915)
    (available margaret pacific_heights t_1915 t_1930)
    (available margaret pacific_heights t_1930 t_1945)

    ;; Wait possibilities within the meeting window if not meeting
    (can_wait pacific_heights t_1900 t_1915)
    (can_wait pacific_heights t_1915 t_1930)
    (can_wait pacific_heights t_1930 t_1945)
  )
  (:goal
    (met margaret)
  )
)