(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    presidio marina_district - location
    jessica - person
    t0900 t0910 t0915 t1015 - time
  )
  (:init
    ;; Starting state: Arrive at Presidio at 9:00 AM
    (at presidio)
    (time_at t0900)

    ;; Movement availability: 10 minutes from Presidio to Marina District (9:00 to 9:10)
    (move_available presidio marina_district t0900 t0910)

    ;; Waiting availability: Player arrives at 9:10, Jessica arrives at 9:15
    (wait_available marina_district t0910 t0915)

    ;; Meeting availability: Jessica at Marina District from 9:15 to 17:45. 
    ;; A 60-minute meeting starts at 9:15 and ends at 10:15.
    (meet_available jessica marina_district t0915 t1015)
  )
  (:goal (has_met jessica))
)