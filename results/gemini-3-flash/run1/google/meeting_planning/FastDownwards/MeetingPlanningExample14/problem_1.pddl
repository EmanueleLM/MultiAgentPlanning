(define (problem meeting_planning_example_14)
  (:domain meeting_planning)
  (:objects
    nob_hill marina_district - location
    t_0900 t_0911 t_1949 t_2000 t_2200 - timepoint
    mary - person
  )
  (:init
    (at_location nob_hill)
    (current_time t_0900)
    
    ;; Travel options from Nob Hill to Marina District (11 minutes)
    (can_travel nob_hill marina_district t_0900 t_0911)
    (can_travel nob_hill marina_district t_1949 t_2000)
    
    ;; Waiting options
    (can_wait nob_hill t_0900 t_1949)
    (can_wait marina_district t_0911 t_2000)
    
    ;; Meeting Mary at Marina District (20:00 to 22:00, 120 minutes)
    (can_meet mary marina_district t_2000 t_2200)
  )
  (:goal (met mary))
)