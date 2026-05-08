(define (problem meeting_planning_problem_43)
  (:domain meeting_planning)
  (:objects
    marina_district chinatown - location
    sandra - person
    t_0900 t_0916 t_0931 - time
  )
  (:init
    ;; Starting conditions: 9:00 AM at Marina District
    (at marina_district)
    (time_is t_0900)

    ;; Sandra's constant location during her window (9:00 to 11:45)
    (person_at sandra chinatown)

    ;; Explicitly modeling the travel duration of 16 minutes from Marina to Chinatown
    ;; 9:00 AM + 16 mins = 9:16 AM
    (can_travel marina_district chinatown t_0900 t_0916)

    ;; Explicitly modeling a 15-minute meeting with Sandra at Chinatown
    ;; This interval (9:16 to 9:31) is within Sandra's window (9:00 to 11:45)
    (can_meet sandra chinatown t_0916 t_0931)
  )
  (:goal
    ;; The objective is to meet as many friends as possible; in this instance, just Sandra.
    (met sandra)
  )
)