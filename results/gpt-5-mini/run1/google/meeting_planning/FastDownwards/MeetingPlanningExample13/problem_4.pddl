(define (problem meeting_planning_problem)
  (:domain meeting_planning)

  (:objects
    you_agent - agent
    betty_person - person

    presidio north_beach - location

    t_09_00 t_18_27 t_18_45 t_20_00 t_20_17 t_22_00 t_23_59 - time
  )

  (:init
    ;; Starting condition: you are at Presidio at 09:00
    (at_time you_agent presidio t_09_00)

    ;; Explicit travel time facts (only these timed legs are modeled).
    ;; Presidio -> North Beach: depart 18:27 arrive 18:45 (18 minutes)
    (travel_time presidio north_beach t_18_27 t_18_45)
    ;; North Beach -> Presidio: depart 20:00 arrive 20:17 (17 minutes)
    (travel_time north_beach presidio t_20_00 t_20_17)

    ;; Waiting/staying transitions that allow advancing to the relevant departure times.
    ;; You can wait at Presidio from 09:00 to 18:27 to be able to depart just before Betty's window.
    (wait_time presidio t_09_00 t_18_27)
    ;; You can wait at North Beach between the meeting start and meeting end if needed.
    (wait_time north_beach t_18_45 t_20_00)

    ;; Betty's validated presence window at North Beach (18:45 - 22:00).
    (meeting_window north_beach t_18_45 t_22_00)

    ;; A 75-minute meeting is feasible starting at 18:45 and ending at 20:00.
    ;; (This encodes the auditor/collector conclusion that a 75-min meeting fits inside the availability.)
    (meeting_possible t_18_45 t_20_00)
  )

  ;; Hard goals: meet Betty during her window and return to Presidio after the meeting.
  (:goal (and
    (met betty_person)
    (at_time you_agent presidio t_20_17)
  ))
)